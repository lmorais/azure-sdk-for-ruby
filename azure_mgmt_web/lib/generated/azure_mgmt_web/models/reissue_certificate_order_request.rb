# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Class representing certificate reissue request
    #
    class ReissueCertificateOrderRequest < MsRestAzure::Resource

      include MsRestAzure

      # @return [Integer] Certificate Key Size
      attr_accessor :key_size

      # @return [Integer] Delay in hours to revoke existing certificate after
      # the new certificate is issued
      attr_accessor :delay_existing_revoke_in_hours


      #
      # Mapper for ReissueCertificateOrderRequest class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ReissueCertificateOrderRequest',
          type: {
            name: 'Composite',
            class_name: 'ReissueCertificateOrderRequest',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              kind: {
                required: false,
                serialized_name: 'kind',
                type: {
                  name: 'String'
                }
              },
              location: {
                required: true,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              type: {
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              tags: {
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              key_size: {
                required: false,
                serialized_name: 'properties.keySize',
                type: {
                  name: 'Number'
                }
              },
              delay_existing_revoke_in_hours: {
                required: false,
                serialized_name: 'properties.delayExistingRevokeInHours',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end