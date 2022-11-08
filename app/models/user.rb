# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  include ActiveModel::SecurePassword
  has_secure_password

  # Mocked from real app
  def accounts
    [Account.new(account_id: "3109625")]
  end

  def active_accounts
    accounts.reject { |account| account.credit_status == "HHD" }
  end

  def accounts_by_site(site)
    active_accounts.select do |account|
      account.sites_accessible.include?(site.to_s) &&
        (account.branded_account_database_names & Brand.brand_names).present?
    end
  end

  def account_by_site(site)
    accounts_by_site(site).first
  end

  def account_ids_by_site(site)
    accounts_by_site(site).map(&:account_id)
  end

  def account_id_by_site(site)
    account_ids_by_site(site).first
  end

  # Mocked from real app
  def has_role?(*)
    true
  end

  def can_view_usd_pricing?
    has_role?(:view_retail_pricing_usd) || has_role?(:view_net_pricing_usd)
  end

  def can_view_cad_pricing?
    has_role?(:view_retail_pricing_cad) || has_role?(:view_net_pricing_cad)
  end

  def can_view_retail_pricing?
    has_role?(:view_retail_pricing_usd) || has_role?(:view_retail_pricing_cad)
  end

  def can_view_net_pricing?
    has_role?(:view_net_pricing_usd) || has_role?(:view_net_pricing_cad)
  end

  def can_view_pricing?
    can_view_usd_pricing? || can_view_cad_pricing?
  end
end
