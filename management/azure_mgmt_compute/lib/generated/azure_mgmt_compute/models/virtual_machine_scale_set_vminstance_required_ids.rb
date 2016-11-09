# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Specifies the list of virtual machine scale set instance IDs.
    #
    class VirtualMachineScaleSetVMInstanceRequiredIDs

      include MsRestAzure

      # @return [Array<String>] the virtual machine scale set instance ids.
      attr_accessor :instance_ids


      #
      # Mapper for VirtualMachineScaleSetVMInstanceRequiredIDs class as Ruby
      # Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'VirtualMachineScaleSetVMInstanceRequiredIDs',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetVMInstanceRequiredIDs',
            model_properties: {
              instance_ids: {
                required: true,
                serialized_name: 'instanceIds',
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
              }
            }
          }
        }
      end
    end
  end
end