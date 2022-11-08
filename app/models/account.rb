# frozen_string_literal: true

# This entire class is mocked from the real app.
class Account
  include ActiveModel::Model

  attr_accessor :account_id

  def sites_accessible
    ["residential"]
  end

  def branded_accounts
    {
      "fabricut" => { "account_id" => "0009624", "private_label" => "3DM", "pl_must_match" => false },
      "s-harris" => { "account_id" => "1480228", "private_label" => "3DM", "pl_must_match" => false },
      "vervain" => { "account_id" => "1627032", "private_label" => "3DM", "pl_must_match" => false },
      "trend" => { "account_id" => "1114942", "private_label" => "3DM", "pl_must_match" => false },
      "stroheim" => { "account_id" => "1970882", "private_label" => "3DM", "pl_must_match" => false },
      "clarencehouse" => { "account_id" => "1500001", "private_label" => "3DM", "pl_must_match" => false }
    }
  end

  def branded_account_database_names
    branded_accounts.keys.map { |brand| brand == "s-harris" ? "sharris" : brand }
  end

  def credit_status
    ""
  end

  def export?
    false
  end

  def currency_code
    "usd"
  end
end
