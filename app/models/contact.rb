# encoding: utf-8
# == Schema Information
#
# Table name: contacts
#
#  id            :integer          not null, primary key
#  client_id     :integer          not null
#  lastname      :string
#  firstname     :string
#  function      :string
#  email         :string
#  phone         :string
#  mobile        :string
#  crm_key       :string
#  created_at    :datetime
#  updated_at    :datetime
#  invoicing_key :string
#

class Contact < ActiveRecord::Base
  CRM_ID_PREFIX = 'crm_'

  belongs_to :client

  has_many :order_contacts, dependent: :destroy
  has_many :orders, through: :order_contacts
  has_many :billing_addresses, dependent: :nullify

  validates_by_schema
  validates :firstname, :lastname, :client_id, presence: true
  validates :invoicing_key, uniqueness: true, allow_blank: true

  scope :list, -> { order(:lastname, :firstname) }

  def to_s
    "#{lastname} #{firstname}"
  end

  def id_or_crm
    id || "#{CRM_ID_PREFIX}#{crm_key}"
  end
end
