# File generated from our OpenAPI spec
defmodule Stripe.Resources.BankTransfer do
  @moduledoc """
  FundingInstructionsBankTransfer
  """

  @typedoc """
  * `country` - The country of the bank account to fund Max length: 5000.
  * `financial_addresses` - A list of financial addresses that can be used to fund a particular balance Expandable.
  * `type` - The bank_transfer type Possible values: `eu_bank_transfer`, `jp_bank_transfer`.
  """
  @type t :: %__MODULE__{}

  defstruct [:country, :financial_addresses, :type]

  @object_name "funding_instructions_bank_transfer"
  def object_name, do: @object_name

  def expandable_fields, do: ["financial_addresses"]

  def __nested_fields__ do
    %{
      "financial_addresses" => %{
        fields: %{
          "aba" => {:resource, Stripe.Resources.Aba},
          "iban" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bic" => :scalar,
              "country" => :scalar,
              "iban" => :scalar
            }
          },
          "sort_code" => {:resource, Stripe.Resources.SortCodeRecords},
          "spei" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "clabe" => :scalar
            }
          },
          "supported_networks" => {:list, :scalar},
          "swift" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "account_type" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_name" => :scalar,
              "swift_code" => :scalar
            }
          },
          "type" => :scalar,
          "zengin" => %{
            fields: %{
              "account_holder_address" => {:resource, Stripe.Resources.Address},
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "account_type" => :scalar,
              "bank_address" => {:resource, Stripe.Resources.Address},
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "branch_code" => :scalar,
              "branch_name" => :scalar
            }
          }
        }
      }
    }
  end
end
