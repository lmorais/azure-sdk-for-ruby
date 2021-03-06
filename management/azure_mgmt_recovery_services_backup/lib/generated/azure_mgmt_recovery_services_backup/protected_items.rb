# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesBackup
  #
  # Composite Swagger for Recovery Services Backup Client
  #
  class ProtectedItems
    include Azure::ARM::RecoveryServicesBackup::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the ProtectedItems class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return [RecoveryServicesBackupClient] reference to the RecoveryServicesBackupClient
    attr_reader :client

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param filter [String] OData filter options.
    # @param skip_token [String] skipToken Filter.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Array<ProtectedItemResource>] operation results.
    #
    def list(vault_name, resource_group_name, filter = nil, skip_token = nil, custom_headers = nil)
      first_page = list_as_lazy(vault_name, resource_group_name, filter, skip_token, custom_headers)
      first_page.get_all_items
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param filter [String] OData filter options.
    # @param skip_token [String] skipToken Filter.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(vault_name, resource_group_name, filter = nil, skip_token = nil, custom_headers = nil)
      list_async(vault_name, resource_group_name, filter, skip_token, custom_headers).value!
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param filter [String] OData filter options.
    # @param skip_token [String] skipToken Filter.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(vault_name, resource_group_name, filter = nil, skip_token = nil, custom_headers = nil)
      api_version = '2016-06-01'
      fail ArgumentError, 'vault_name is nil' if vault_name.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/Subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/{vaultName}/backupProtectedItems'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'vaultName' => vault_name,'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => api_version,'$filter' => filter,'$skipToken' => skip_token},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ProtectedItemResourceList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Provides the details of the backed up item. This is an asynchronous
    # operation. To know the status of the operation, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item name whose details are to
    # be fetched.
    # @param filter [String] OData filter options.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ProtectedItemResource] operation results.
    #
    def get(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, filter = nil, custom_headers = nil)
      response = get_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, filter, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Provides the details of the backed up item. This is an asynchronous
    # operation. To know the status of the operation, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item name whose details are to
    # be fetched.
    # @param filter [String] OData filter options.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, filter = nil, custom_headers = nil)
      get_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, filter, custom_headers).value!
    end

    #
    # Provides the details of the backed up item. This is an asynchronous
    # operation. To know the status of the operation, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item name whose details are to
    # be fetched.
    # @param filter [String] OData filter options.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, filter = nil, custom_headers = nil)
      api_version = '2016-06-01'
      fail ArgumentError, 'vault_name is nil' if vault_name.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'fabric_name is nil' if fabric_name.nil?
      fail ArgumentError, 'container_name is nil' if container_name.nil?
      fail ArgumentError, 'protected_item_name is nil' if protected_item_name.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/Subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/{vaultName}/backupFabrics/{fabricName}/protectionContainers/{containerName}/protectedItems/{protectedItemName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'vaultName' => vault_name,'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id,'fabricName' => fabric_name,'containerName' => container_name,'protectedItemName' => protected_item_name},
          query_params: {'api-version' => api_version,'$filter' => filter},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ProtectedItemResource.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Enables backup of an item or to modifies the backup policy information of an
    # already backed up item. This is an asynchronous operation. To know the
    # status of the operation, call the GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Item name to be backed up.
    # @param resource_protected_item [ProtectedItemResource] resource backed up
    # item
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def create_or_update(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_protected_item, custom_headers = nil)
      response = create_or_update_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_protected_item, custom_headers).value!
      nil
    end

    #
    # Enables backup of an item or to modifies the backup policy information of an
    # already backed up item. This is an asynchronous operation. To know the
    # status of the operation, call the GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Item name to be backed up.
    # @param resource_protected_item [ProtectedItemResource] resource backed up
    # item
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_or_update_with_http_info(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_protected_item, custom_headers = nil)
      create_or_update_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_protected_item, custom_headers).value!
    end

    #
    # Enables backup of an item or to modifies the backup policy information of an
    # already backed up item. This is an asynchronous operation. To know the
    # status of the operation, call the GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backup item.
    # @param container_name [String] Container name associated with the backup
    # item.
    # @param protected_item_name [String] Item name to be backed up.
    # @param resource_protected_item [ProtectedItemResource] resource backed up
    # item
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_or_update_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, resource_protected_item, custom_headers = nil)
      api_version = '2016-06-01'
      fail ArgumentError, 'vault_name is nil' if vault_name.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'fabric_name is nil' if fabric_name.nil?
      fail ArgumentError, 'container_name is nil' if container_name.nil?
      fail ArgumentError, 'protected_item_name is nil' if protected_item_name.nil?
      fail ArgumentError, 'resource_protected_item is nil' if resource_protected_item.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = ProtectedItemResource.mapper()
      request_content = @client.serialize(request_mapper,  resource_protected_item, 'resource_protected_item')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/Subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/{vaultName}/backupFabrics/{fabricName}/protectionContainers/{containerName}/protectedItems/{protectedItemName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'vaultName' => vault_name,'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id,'fabricName' => fabric_name,'containerName' => container_name,'protectedItemName' => protected_item_name},
          query_params: {'api-version' => api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:put, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Used to disable backup of an item within a container. This is an
    # asynchronous operation. To know the status of the request, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item to be deleted.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, custom_headers = nil)
      response = delete_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, custom_headers).value!
      nil
    end

    #
    # Used to disable backup of an item within a container. This is an
    # asynchronous operation. To know the status of the request, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item to be deleted.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, custom_headers = nil)
      delete_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, custom_headers).value!
    end

    #
    # Used to disable backup of an item within a container. This is an
    # asynchronous operation. To know the status of the request, call the
    # GetItemOperationResult API.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param fabric_name [String] Fabric name associated with the backed up item.
    # @param container_name [String] Container name associated with the backed up
    # item.
    # @param protected_item_name [String] Backed up item to be deleted.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(vault_name, resource_group_name, fabric_name, container_name, protected_item_name, custom_headers = nil)
      api_version = '2016-06-01'
      fail ArgumentError, 'vault_name is nil' if vault_name.nil?
      fail ArgumentError, 'resource_group_name is nil' if resource_group_name.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, 'fabric_name is nil' if fabric_name.nil?
      fail ArgumentError, 'container_name is nil' if container_name.nil?
      fail ArgumentError, 'protected_item_name is nil' if protected_item_name.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/Subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.RecoveryServices/vaults/{vaultName}/backupFabrics/{fabricName}/protectionContainers/{containerName}/protectedItems/{protectedItemName}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'vaultName' => vault_name,'resourceGroupName' => resource_group_name,'subscriptionId' => @client.subscription_id,'fabricName' => fabric_name,'containerName' => container_name,'protectedItemName' => protected_item_name},
          query_params: {'api-version' => api_version},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:delete, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 202 || status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful
    # call to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ProtectedItemResourceList] operation results.
    #
    def list_next(next_page_link, custom_headers = nil)
      response = list_next_async(next_page_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful
    # call to List operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_page_link, custom_headers = nil)
      list_next_async(next_page_link, custom_headers).value!
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param next_page_link [String] The NextLink from the previous successful
    # call to List operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_page_link, custom_headers = nil)
      fail ArgumentError, 'next_page_link is nil' if next_page_link.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '{nextLink}'

      request_url = @base_url || @client.base_url

      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          skip_encoding_path_params: {'nextLink' => next_page_link},
          headers: request_headers.merge(custom_headers || {}),
          base_url: request_url
      }
      promise = @client.make_request_async(:get, path_template, options)

      promise = promise.then do |result|
        http_response = result.response
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(result.request, http_response, error_model)
        end

        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = ProtectedItemResourceList.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Provides a pageable list of all items that can be backed up within a
    # subscription.
    #
    # @param vault_name [String] The name of the recovery services vault.
    # @param resource_group_name [String] The name of the resource group where the
    # recovery services vault is present.
    # @param filter [String] OData filter options.
    # @param skip_token [String] skipToken Filter.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [ProtectedItemResourceList] which provide lazy access to pages of
    # the response.
    #
    def list_as_lazy(vault_name, resource_group_name, filter = nil, skip_token = nil, custom_headers = nil)
      response = list_async(vault_name, resource_group_name, filter, skip_token, custom_headers).value!
      unless response.nil?
        page = response.body
        page.next_method = Proc.new do |next_page_link|
          list_next_async(next_page_link, custom_headers)
        end
        page
      end
    end

  end
end
