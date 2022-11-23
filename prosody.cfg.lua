component_ports = { 5347 }
component_interfaces = { "yourip" }
plugin_paths = { "/etc/prosody/modules","/snikket/prosody/modules" } -- this adds a modules dir in the persistent mount so you can load more modules, specificallyt the privilege mod
Component "upload.chat.yourdomain.tld" "http_file_share" -- replace with your real domain
Component "telegram.chat.yourdomain.tld" -- replace this with your real domain
  component_secret = "yoursecret"  -- replace this with a real secret!
  modules_enabled = {"privilege"}
Component "facebook.chat.yourdomain.tld" --replace this with your real domain
  component_secret = "yourothersecret"  -- replace this with a real secret!
  modules_enabled = {"privilege"}

VirtualHost "chat.yourdomain.tld" --replace with your real domain
  privileged_entities = {
    ["telegram.chat.yourdomain.tld"] = {
      roster = "both";
      message = "outgoing";
    },
    ["facebook.chat.yourdomain.tld"] = {
      roster = "both";
      message = "outgoing";
    }
  }

