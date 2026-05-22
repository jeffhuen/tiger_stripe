# File generated from our OpenAPI spec
defmodule Stripe.Services.FileService do
  @moduledoc """
  File

  This object represents files hosted on Stripe's servers. You can upload
  files with the [create file](https://api.stripe.com#create_file) request
  (for example, when uploading dispute evidence). Stripe also
  creates files independently (for example, the results of a [Sigma scheduled
  query](#scheduled_queries)).

  Related guide: [File upload guide](https://docs.stripe.com/file-upload)
  """
  alias Stripe.Client

  @doc """
  Create a file

  To upload a file to Stripe, you need to send a request of type `multipart/form-data`. Include the file you want to upload in the request, and the parameters for creating a file.

  All of Stripe’s officially supported Client libraries support sending `multipart/form-data`.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.File.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/files", Keyword.merge(opts, params: params))
  end

  @doc """
  List all files

  Returns a list of the files that your account has access to. Stripe sorts and returns the files by their creation dates, placing the most recently created files at the top.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/files", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a file

  Retrieves the details of an existing file object. After you supply a unique file ID, Stripe returns the corresponding file object. Learn how to [access file contents](https://docs.stripe.com/docs/file-upload#download-file-contents).
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.File.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, file, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/files/#{file}", Keyword.merge(opts, params: params))
  end
end
