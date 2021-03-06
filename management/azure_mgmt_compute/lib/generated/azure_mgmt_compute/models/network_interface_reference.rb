# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes a network interface reference.
    #
    class NetworkInterfaceReference < MsRestAzure::SubResource

      include MsRestAzure

      # @return [Boolean] whether this is a primary NIC on a virtual machine
      attr_accessor :primary


      #
      # Mapper for NetworkInterfaceReference class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'NetworkInterfaceReference',
          type: {
            name: 'Composite',
            class_name: 'NetworkInterfaceReference',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              primary: {
                required: false,
                serialized_name: 'properties.primary',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
