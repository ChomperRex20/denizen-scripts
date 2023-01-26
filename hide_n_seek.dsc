hns_commands:
    type: command
    name: hns
    description: compiles hide and seek commands
    usage: /hns game [create|end]|round [start|stop]|join|leave|hiders
    tab completions:
        1: game|round|join|leave|hiders|warp
        2: <context.args.first.equals[warp].if_true[<server.flag[warps].keys>].if_false[]>|<context.args.first.equals[game].if_true[create|end].if_false[]>|<context.args.first.equals[round].if_true[start|stop].if_false[]>
    script:
        - choose <context.args.first>:
            - case game:
                - if <context.args.get[2]> == create:
                    - run hns_game_create
                - else if <context.args.get[2]> == end:
                    - run hns_game_end
            - case round:
                - if <context.args.get[2]> == start:
                    - run hns_round_start
                - else if <context.args.get[2]> == stop:
                    - run hns_round_stop
            - case join:
                - run hns_join
            - case leave:
                - run hns_leave
            - case hiders:
                - run hns_hiders
            - case warp:
                - run hns_warp






hns_game_create:
    type: task
    script:
    - if <server.has_flag[HnSgame]>:
        - narrate "<&[warning]>There is already a Hide and Seek game."
    - else:
        - flag server HnSgame
        - flag player host
        - flag server hnsnarrate:->:<player>
        - flag server hnsgamestart:!
        #- narrate "You have created a hide and seek game!"
        - announce "<yellow><bold><player.name> <aqua>has created a Hide and Seek event, use /has join' to join!"


hns_warp:
    type: task
    script:
        - if <server.has_flag[HnSgame]> && <player.has_flag[host]>:
            - if <context.args.get[2]> in <server.flag[warps]>:
                - define gamewarp <context.args.get[1]>
                - flag server hnswarp:!
                - flag server hnswarp:->:<[gamewarp]>
                - teleport <server.flag[hnsnarrate]> <server.flag[warps.<server.flag[hnswarp].first>]>
                - narrate "<aqua>You have been teleported to <yellow><server.flag[hnswarp].first>"
            - else:
                - narrate "<yellow><context.args.get[1]> is not a valid warp"
        - else if <server.has_flag[HnSgame]> && <player> in <server.flag[hnsnarrate]>:
            - narrate "<yellow>You are not the host, you can not use this command"
        - else:
            - narrate "<yellow> You are not in a hide and seek game"


hns_round_start:
    type: task
    script:
    - if <server.has_flag[HnSgame]>:
        - if <player.has_flag[host]>:
            - if <server.has_flag[hnsgamestart]>:
                - narrate "<yellow>The game has already started"
            - else:
                - if <server.flag[hider].size> < 2:
                    - narrate "<yellow>you dont have enough friends"
                - else:
                    - Narrate "<red><bold><player.name><aqua> has started the game, find your hiding spot <red><bold>quick! <aqua> You have 60 seconds" targets:<server.flag[hnsnarrate]>
                    - cast blindness duration:60 amplifier:255 <player>
                    - cast slow duration:60 amplifier:255 <player>
                    - cast glowing duration:10000 amplifier:255 <player>
                    - wait 1m
                    - flag server hnsgamestart
                    - narrate "<red><bold>Your time is up, the seeker is hunting!"
        - else:
            - narrate "<yellow>You are not the host, you can not start the game"
    - else:
        - narrate "<yellow>There is no Hide and Seek Game"


hns_round_stop:
    type: task
    script:
    - if <server.has_flag[HnSgame]>:
        - if <player.has_flag[host]>:
            - if <server.has_flag[hnsgamestart]>:
                - flag server hnsgamestart:!
                - cast glowing remove <server.flag[seeker]>
                - narrate "<yellow><bold><player.name><&r><yellow> has ended the Hide and Seek round" targets:<server.flag[hnsnarrate]>
                - flag server hider:|:<server.flag[seeker]>
                - flag server hider:<-:li@
                - flag server seeker:!
            - else:
                - narrate "<yellow>The game has not started"
        - else:
            - narrate "<yellow>You are not the host, you can not end the round"
    - else:
        - narrate "<yellow>There is no Hide and Seek Game"


hns_game_end:
    type: task
    script:
    - if <server.has_flag[HnSgame]>:
        - if <player.has_flag[host]>:
            - narrate "<yellow><bold><player.name><yellow> has stopped the Hide and Seek event" targets:<server.flag[hnsnarrate]>
            - run stop_hns_game
        - else:
            - narrate "<yellow>You are not the host, you can not stop the game"
    - else:
        - narrate "<yellow>There is no Hide and Seek Game"


hns_join:
    type: task
    script:
    - if <player.has_flag[host]>:
        - narrate "<yellow>You are the host, you can not join the game"
    - else if ( <server.has_flag[seeker]> || <server.has_flag[hider]> ) && ( <player> in <server.flag[hider]> || <player> in <server.flag[seeker]> ):
        - narrate "<yellow>You are already in the game"
    - else if <server.has_flag[HnSgame]>:
        - if <server.has_flag[hnsgamestart]>:
            - narrate "<yellow><bold><player.name><aqua> has joined the game and become a <red><bold>Seeker!" targets:<server.flag[hnsnarrate]>
            - flag server seeker:->:<player>
            - cast glowing duration:10000 amplifier:255 <player>
            - narrate "<aqua>The game has already started, you have been made a <red><bold>Seeker!"
            - narrate "<red><bold>Right<red> click hiding players to mark them as found!"
        - else:
            - narrate "<yellow><bold><player.name><yellow> has joined the game and become a <dark_green><bold>Hider!" targets:<server.flag[hnsnarrate]>
            - flag server hider:->:<player>
            - narrate "<aqua>You have been added to the <dark_green><bold>Hiders,<aqua> get ready to hide!"
        - flag server hnsnarrate:->:<player>
        - teleport <player> <server.flag[warps.<server.flag[hnswarp].first>]>
        - narrate "<aqua> you have been teleported to <yellow><server.flag[hnswarp].first>"
    - else:
        - narrate "<yellow>There is no hide and seek game."


hns_leave:
    type: task
    script:
        - if ( if <server.has_flag[seeker]> || <server.has_flag[hider]> ) && ( <player> in <server.flag[hider]> || <player> in <server.flag[seeker]> ):
            - run remove_hns_player
        - else if <player.has_flag[host]>:
            - Narrate "<yellow>You can not leave, you are the host"
        - else:
            - Narrate "<yellow>You are not in a Hide and Seek game"


hns_hiders:
    type: task
    script:
        - if <server.has_flag[HnSgame]> && <server.has_flag[hider]> && <server.flag[hider].size> >= 1:
            - narrate "<aqua>There are <dark_green><server.flag[hider].size><aqua> hiders left."
            - narrate "<dark_green><bold><server.flag[hider].formatted>"
        - else:
            - narrate "<yellow>There are no hiders"


player_leaves_server:
    type: world
    events:
        after player quit:
            - if <server.has_flag[hnsgame]> && ( <server.has_flag[seeker]> || <server.has_flag[hider]> ) && ( <player> in <server.flag[hider]> || <player> in <server.flag[seeker]> ):
                - run remove_hns_player
            - else if <player.has_flag[host]>:
                - narrate "<yellow>The host <bold><player.name><yellow> has left the server, the Hide and Seek event has ended." targets:<server.flag[hnsnarrate]>
                - run stop_hns_game


hider_hit_by_seeker:
    type: world
    events:
        after player right clicks entity:
            - if <server.has_flag[hnsgamestart]>:
                - if <player.has_flag[host]> || ( <server.has_flag[seeker]> && <player> in <server.flag[seeker]> ):
                    - if <player.target> in <server.flag[hider]>:
                        - Narrate "<dark_green><bold><player.target.name><aqua> has been found, they are now a <red><bold>Seeker!" targets:<server.flag[hnsnarrate]>
                        - narrate "<red>Right click hiding players to mark them as found!" targets:<player.target>
                        - flag server hider:<-:<player.target>
                        - flag server seeker:->:<player.target>
                        - cast glowing duration:10000 amplifier:255 <player.target>
                        - if <server.flag[hider].size> == 1:
                            - run hider_win
            - else:
                - stop



remove_hns_player:
    type: task
    script:
        - narrate "<yellow><bold><player.name><yellow> has left the Hide and Seek game" targets:<server.flag[hnsnarrate]>
        - cast glowing remove <player>
        - flag server hider:<-:<player>
        - flag server seeker:<-:<player>
        - flag server hnsnarrate:<-:<player>
        - if <server.has_flag[hnsgamestart]> && <server.flag[hider].size> == 1:
            - run hider_win


hider_win:
    type: task
    script:
        - Narrate "<dark_green><bold><server.flag[hider].first.name><aqua> is the last hider, they <gold><bold>WIN!" targets:<server.flag[hnsnarrate]>
        - cast glowing remove <server.flag[seeker]>
        - flag server hnsgamestart:!
        - flag server hider:|:<server.flag[seeker]>
        - flag server hider:<-:li@
        - flag server seeker:!


stop_hns_game:
    type: task
    script:
        - cast glowing remove <player>
        - cast glowing remove <server.flag[seeker]>
        - flag server HnSgame:!
        - flag player host:!
        - flag server hnsgamestart:!
        - flag server seeker:!
        - flag server hider:!
        - flag server host:!
        - flag server hnsnarrate:!