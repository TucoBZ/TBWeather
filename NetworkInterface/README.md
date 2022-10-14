# NetworkInterface

This package contains the Interface to communicate with Network, there is no logic here. The principal idea here is to make this module as a dependency for other Modules and the Application handle the injection with a concrete module.

Whenever there is a change in the concrete Network module, it will not be necessary to build every dependency from it, because the dependencies relies on this interface only, making the application build faster.
