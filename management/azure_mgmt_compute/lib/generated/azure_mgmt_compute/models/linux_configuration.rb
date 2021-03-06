# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes Windows Configuration of the OS Profile.
    #
    class LinuxConfiguration

      include MsRestAzure

      # @return [Boolean] whether Authentication using user name and password
      # is allowed or not
      attr_accessor :disable_password_authentication

      # @return [SshConfiguration] the SSH configuration for linux VMs
      attr_accessor :ssh


      #
      # Mapper for LinuxConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'LinuxConfiguration',
          type: {
            name: 'Composite',
            class_name: 'LinuxConfiguration',
            model_properties: {
              disable_password_authentication: {
                required: false,
                serialized_name: 'disablePasswordAuthentication',
                type: {
                  name: 'Boolean'
                }
              },
              ssh: {
                required: false,
                serialized_name: 'ssh',
                type: {
                  name: 'Composite',
                  class_name: 'SshConfiguration'
                }
              }
            }
          }
        }
      end
    end
  end
end
