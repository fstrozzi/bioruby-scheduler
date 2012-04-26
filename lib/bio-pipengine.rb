# Please require your code below, respecting the naming conventions in the
# bioruby directory tree.
#
# For example, say you have a plugin named bio-plugin, the only uncommented
# line in this file would be 
#
#   require 'bio/bio-plugin/plugin'
#
# In this file only require other files. Avoid other source code.



require 'java'
require 'yaml'

$CLASSPATH << File.expand_path(File.join(File.dirname __FILE__,"..","ext","hazelcast-all-2.0.3.jar"))

import com.hazelcast.core.Hazelcast;

