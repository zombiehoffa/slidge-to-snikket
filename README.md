# slidge-to-snikket
getting snikket and slidge to play nice
This outlines how I managed to get snikket and slidge working together in case anyone else needs to do this. I found the biggest difficulty being sparse snikket documentation. I do not claimt his is the right way to do this, I am just sharing how I got it to work to provide a hint for others treading the same sparsely document path I was on.


The general path is as follows:

1. get your snikket docker-compose in order using local folders instead of volumes so you can easily add your prosody.cfg.lua and extra modules
2. go to the prosody dir created by bringing your docker-compose online (mine was in /etc/snikket/data/prosody) and create prosody.cfg.lua text file modelled after mine.
3.  install the privilege module. I followed this: https://prosody.im/doc/installing_modules using hg to clone all of them into a seperate dir then copying over mod_privilege in to the extra modules dir I specified in my prosody.cfg.lua. I tried ln -s to link them instead to make updating easier but it didn't work (wrong paths. This may have worked had I had both the path with all modules and the modules dir I was using for active prosody modules mounted in the container and did the linkng from the containers
4. bring your docker-compose file up again with --force-recreate or get into bash  in the snikket container and prosodyctl reload to get the prosody.cfg.lua you created in 2 to load in.
5. go into your client and discover services and see if it worked. I am probably forgetting something.

