# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  module Models
    #
    # Request parameters for updating an existing application
    #
    class ApplicationUpdateParameters

      include MsRestAzure

      # @return [Boolean] Indicates if the application will be available to
      # other tenants
      attr_accessor :available_to_other_tenants

      # @return [String] Application display name
      attr_accessor :display_name

      # @return [String] Application homepage
      attr_accessor :homepage

      # @return [Array<String>] Application Uris
      attr_accessor :identifier_uris

      # @return [Array<String>] Application reply Urls
      attr_accessor :reply_urls

      # @return [Array<KeyCredential>] the list of KeyCredential objects
      attr_accessor :key_credentials

      # @return [Array<PasswordCredential>] the list of PasswordCredential
      # objects
      attr_accessor :password_credentials


      #
      # Mapper for ApplicationUpdateParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ApplicationUpdateParameters',
          type: {
            name: 'Composite',
            class_name: 'ApplicationUpdateParameters',
            model_properties: {
              available_to_other_tenants: {
                required: false,
                serialized_name: 'availableToOtherTenants',
                type: {
                  name: 'Boolean'
                }
              },
              display_name: {
                required: false,
                serialized_name: 'displayName',
                type: {
                  name: 'String'
                }
              },
              homepage: {
                required: false,
                serialized_name: 'homepage',
                type: {
                  name: 'String'
                }
              },
              identifier_uris: {
                required: false,
                serialized_name: 'identifierUris',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              reply_urls: {
                required: false,
                serialized_name: 'replyUrls',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              key_credentials: {
                required: false,
                serialized_name: 'keyCredentials',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'KeyCredentialElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'KeyCredential'
                      }
                  }
                }
              },
              password_credentials: {
                required: false,
                serialized_name: 'passwordCredentials',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'PasswordCredentialElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'PasswordCredential'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
