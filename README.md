# slidge-to-snikket
Getting snikket and slidge to play nice
This outlines how I managed to get snikket (https://snikket.org/) and slidge (website: https://sr.ht/~nicoco/slidge/sources  docs:https://slidge.readthedocs.io/en/latest/) working together in case anyone else needs to do this (if you want to talk to people on signal, telegram, mattermost, facebook messenger, discord, steam, hacker news, and/or skype all through your xmpp client then you probably need this). I found the biggest difficulty being sparse snikket documentation. I do not claim this is the right way to do this, I am just sharing how I got it to work to provide a hint for others treading the same sparsely document path I was on.

This works because snikket has an undocumented/poorly documented feature where it will try to load any *.cfg.lua in /snikket/prosody in thier snikket_server container My prosody.cfg.lua file edited and put in the right spot loads the stuff you need to get telegram and facebook working on the snikket prosody side as far as configuration goes, as well as creates a spot you can put modules to be able to load modules the snikket guys didn't include (explicitely the privilege mod needed by slidge in this case).


The general path is as follows:

1. get your snikket docker-compose in order using local folders instead of volumes so you can easily add your prosody.cfg.lua and extra modules
2. go to the prosody dir created by bringing your docker-compose online (mine was in /etc/snikket/data/prosody) and create prosody.cfg.lua text file modelled after mine.
3.  install the privilege module. I followed this: https://prosody.im/doc/installing_modules using hg to clone all of them into a seperate dir then copying over mod_privilege in to the extra modules dir I specified in my prosody.cfg.lua. I tried ln -s to link them instead to make updating easier but it didn't work (wrong paths. This may have worked had I had both the path with all modules and the modules dir I was using for active prosody modules mounted in the container and did the linkng from the containers
4. bring your docker-compose file up again with --force-recreate or get into bash  in the snikket container and prosodyctl reload to get the prosody.cfg.lua you created in 2 to load in.
5. go into your client and discover services and see if it worked. I am probably forgetting something.

