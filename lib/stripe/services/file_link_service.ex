# File generated from our OpenAPI spec
defmodule Stripe.Services.FileLinkService do
  @moduledoc """
  FileLink

  To share the contents of a `File` object with non-Stripe users, you can
  create a `FileLink`. `FileLink`s contain a URL that you can use to
  retrieve the contents of the file without authentication.
  """
  alias Stripe.Client

  @doc """
  Create a file link

  Creates a new file link object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FileLink.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/file_links", Keyword.merge(opts, params: params))
  end

  @doc """
  List all file links

  Returns a list of file links.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/file_links", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a file link

  Retrieves the file link with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FileLink.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, link, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/file_links/#{link}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a file link

  Updates an existing file link object. Expired links can no longer be updated.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FileLink.t()} | {:error, Stripe.Error.t()}
  def update(client, link, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/file_links/#{link}", Keyword.merge(opts, params: params))
  end
end
