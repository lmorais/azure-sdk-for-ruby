# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Information about a service principal identity for the cluster to use
    # for manipulating Azure APIs.
    #
    class ContainerServiceServicePrincipalProfile

      include MsRestAzure

      # @return [String] The ID for the service principal.
      attr_accessor :client_id

      # @return [String] The secret password associated with the service
      # principal.
      attr_accessor :secret


      #
      # Mapper for ContainerServiceServicePrincipalProfile class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ContainerServiceServicePrincipalProfile',
          type: {
            name: 'Composite',
            class_name: 'ContainerServiceServicePrincipalProfile',
            model_properties: {
              client_id: {
                required: true,
                serialized_name: 'clientId',
                type: {
                  name: 'String'
                }
              },
              secret: {
                required: true,
                serialized_name: 'secret',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
