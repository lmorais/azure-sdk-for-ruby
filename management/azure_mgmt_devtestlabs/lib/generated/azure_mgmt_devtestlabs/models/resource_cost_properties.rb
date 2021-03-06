# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::DevTestLabs
  module Models
    #
    # The properties of a resource cost item.
    #
    class ResourceCostProperties

      include MsRestAzure

      # @return [String] The name of the resource.
      attr_accessor :resourcename

      # @return [String] The name of the resource group.
      attr_accessor :resource_group_name

      # @return [Float] The cost component of the resource cost item.
      attr_accessor :resource_cost

      # @return [String] The email address of the owner of the resource
      attr_accessor :owner

      # @return [String] The category of the resource. For VM this will be set
      # to its size, for storage account it will be set to standard or premium
      attr_accessor :category

      # @return [Boolean] Whether the resource still exists or not
      attr_accessor :exists

      # @return [String] The logical resource type (ex. virtualmachine,
      # storageaccount)
      attr_accessor :resource_type


      #
      # Mapper for ResourceCostProperties class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ResourceCostProperties',
          type: {
            name: 'Composite',
            class_name: 'ResourceCostProperties',
            model_properties: {
              resourcename: {
                required: false,
                serialized_name: 'resourcename',
                type: {
                  name: 'String'
                }
              },
              resource_group_name: {
                required: false,
                serialized_name: 'resourceGroupName',
                type: {
                  name: 'String'
                }
              },
              resource_cost: {
                required: false,
                serialized_name: 'resourceCost',
                type: {
                  name: 'Double'
                }
              },
              owner: {
                required: false,
                serialized_name: 'owner',
                type: {
                  name: 'String'
                }
              },
              category: {
                required: false,
                serialized_name: 'category',
                type: {
                  name: 'String'
                }
              },
              exists: {
                required: false,
                serialized_name: 'exists',
                type: {
                  name: 'Boolean'
                }
              },
              resource_type: {
                required: false,
                serialized_name: 'resourceType',
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
