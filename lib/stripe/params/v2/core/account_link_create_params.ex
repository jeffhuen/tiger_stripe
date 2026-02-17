# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountLinkCreateParams do
  @moduledoc "Parameters for account link create."

  @typedoc """
  * `account` - The ID of the Account to create link for.
  * `use_case` - The use case of the AccountLink.
  """
  @type t :: %__MODULE__{
          account: String.t(),
          use_case: __MODULE__.UseCase.t()
        }

  defstruct [:account, :use_case]

  defmodule UseCase do
    @moduledoc "Nested parameters."

    @typedoc """
    * `account_onboarding` - Hash containing configuration options for an Account Link object that onboards a new account.
    * `account_update` - Hash containing configuration options for an Account Link that updates an existing account.
    * `type` - Open Enum. The type of Account Link the user is requesting. Possible values: `account_onboarding`, `account_update`.
    """
    @type t :: %__MODULE__{
            account_onboarding: __MODULE__.AccountOnboarding.t() | nil,
            account_update: __MODULE__.AccountUpdate.t() | nil,
            type: String.t() | nil
          }
    defstruct [:account_onboarding, :account_update, :type]

    defmodule AccountOnboarding do
      @moduledoc "Nested parameters."

      @typedoc """
      * `collection_options` - Specifies the requirements that Stripe collects from v2/core/accounts in the Onboarding flow.
      * `configurations` - Open Enum. A v2/core/account can be configured to enable certain functionality. The configuration param targets the v2/core/account_link to collect information for the specified v2/core/account configuration/s.
      * `refresh_url` - The URL the user will be redirected to if the AccountLink is expired, has been used, or is otherwise invalid. The URL you specify should attempt to generate a new AccountLink with the same parameters used to create the original AccountLink, then redirect the user to the new AccountLink’s URL so they can continue the flow. If a new AccountLink cannot be generated or the redirect fails you should display a useful error to the user. Please make sure to implement authentication before redirecting the user in case this URL is leaked to a third party.
      * `return_url` - The URL that the user will be redirected to upon completing the linked flow.
      """
      @type t :: %__MODULE__{
              collection_options: __MODULE__.CollectionOptions.t() | nil,
              configurations: [String.t()] | nil,
              refresh_url: String.t() | nil,
              return_url: String.t() | nil
            }
      defstruct [:collection_options, :configurations, :refresh_url, :return_url]

      defmodule CollectionOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `fields` - Specifies whether the platform collects only currently_due requirements (`currently_due`) or both currently_due and eventually_due requirements (`eventually_due`). If you don’t specify collection_options, the default value is currently_due. Possible values: `currently_due`, `eventually_due`.
        * `future_requirements` - Specifies whether the platform collects future_requirements in addition to requirements in Connect Onboarding. The default value is `omit`. Possible values: `include`, `omit`.
        """
        @type t :: %__MODULE__{
                fields: String.t() | nil,
                future_requirements: String.t() | nil
              }
        defstruct [:fields, :future_requirements]
      end
    end

    defmodule AccountUpdate do
      @moduledoc "Nested parameters."

      @typedoc """
      * `collection_options` - Specifies the requirements that Stripe collects from v2/core/accounts in the Onboarding flow.
      * `configurations` - Open Enum. A v2/account can be configured to enable certain functionality. The configuration param targets the v2/account_link to collect information for the specified v2/account configuration/s.
      * `refresh_url` - The URL the user will be redirected to if the Account Link is expired, has been used, or is otherwise invalid. The URL you specify should attempt to generate a new Account Link with the same parameters used to create the original Account Link, then redirect the user to the new Account Link URL so they can continue the flow. Make sure to authenticate the user before redirecting to the new Account Link, in case the URL leaks to a third party. If a new Account Link can't be generated, or if the redirect fails, you should display a useful error to the user.
      * `return_url` - The URL that the user will be redirected to upon completing the linked flow.
      """
      @type t :: %__MODULE__{
              collection_options: __MODULE__.CollectionOptions.t() | nil,
              configurations: [String.t()] | nil,
              refresh_url: String.t() | nil,
              return_url: String.t() | nil
            }
      defstruct [:collection_options, :configurations, :refresh_url, :return_url]

      defmodule CollectionOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `fields` - Specifies whether the platform collects only currently_due requirements (`currently_due`) or both currently_due and eventually_due requirements (`eventually_due`). The default value is `currently_due`. Possible values: `currently_due`, `eventually_due`.
        * `future_requirements` - Specifies whether the platform collects future_requirements in addition to requirements in Connect Onboarding. The default value is `omit`. Possible values: `include`, `omit`.
        """
        @type t :: %__MODULE__{
                fields: String.t() | nil,
                future_requirements: String.t() | nil
              }
        defstruct [:fields, :future_requirements]
      end
    end
  end
end
