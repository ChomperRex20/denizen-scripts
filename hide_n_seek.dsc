hns_commands:
  type: command
  name: hns
  description: compiles hide and seek commands
  usage: /hns game [create|end]|round [start|stop]|join|leave|hiders
  tab completions:
    1: game|round|join|leave|hiders|warp|help
    2: <context.args.first.equals[warp].if_true[<server.flag[warps].keys>].if_false[]>|<context.args.first.equals[game].if_true[create|end].if_false[]>|<context.args.first.equals[round].if_true[start|stop].if_false[]>
  script:
    - if !<context.args.first.exists>:
      - run hns_command_error
      - stop
    - choose <context.args.first>:
      - case game:
        - if !<context.args.get[2].exists>:
          - run hns_command_error
          - stop
        - if <context.args.get[2]> == create:
          - run hns_game_create
        - else if <context.args.get[2]> == end:
          - run hns_game_end
      - case round:
        - if !<context.args.get[2].exists>:
          - run hns_command_error
          - stop
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
      - case help:
        - run hns_help
      - default:
        - run hns_command_error
        - stop

hns_game_create:
  type: task
  script:
    - if <server.has_flag[hns_game]>:
      - narrate "<&[warning]>There is already a Hide and Seek game."
      - stop
    - flag server hnsgame
    - flag player host
    - flag server hns_narrate:->:<player>
    - flag server hns_game_start:!
    - announce "<yellow><bold><player.name> <aqua>has created a Hide and Seek event, use /hns join' to join!"

hns_warp:
  type: task
  script:
    - if !<server.has_flag[hns_game]> && !<player.has_flag[host]>:
      - narrate "<yellow>You are not the host, you can not use this command"
      - stop
    - if !<context.args.get[2]> in !<server.flag[warps]>:
      - narrate "<yellow><context.args.get[1]> is not a valid warp"
      - stop
    - if !<server.has_flag[hns_game]> && !<player> in <server.flag[hns_narrate]>:
      - narrate "<yellow> You are not in a hide and seek game"
      - stop
    - define game_warp <context.args.get[1]>
    - flag server hns_warp:!
    - flag server hns_warp:->:<[game_warp]>
    - teleport <server.flag[hns_narrate]> <server.flag[warps.<server.flag[hns_warp].first>]>
    - narrate "<aqua>You have been teleported to <yellow><server.flag[hns_warp].first>"

hns_round_start:
  type: task
  script:
    - if !<server.has_flag[hns_game]>:
      - narrate "<yellow>There is no Hide and Seek Game"
      - stop
    - if !<player.has_flag[host]>:
      - narrate "<yellow>You are not the host, you can not start the game"
      - stop
    - if <server.has_flag[hns_game_start]>:
      - narrate "<yellow>The game has already started"
      - stop
    - if <server.flag[hiders].size> < 2:
      - narrate "<yellow>you dont have enough friends"
      - stop
    - Narrate "<red><bold><player.name><aqua> has started the game, find your hiding spot <red><bold>quick! <aqua> You have 60 seconds" targets:<server.flag[hns_narrate]>
    - cast blindness duration:60 amplifier:255 <player>
    - cast slow duration:60 amplifier:255 <player>
    - cast glowing duration:10000 amplifier:255 <player>
    - wait 1m
    - flag server hnsgamestart
    - narrate "<red><bold>Your time is up, the seeker is hunting!"

hns_round_stop:
  type: task
  script:
    - if !<server.has_flag[hns_game]>:
      - narrate "<yellow>There is no Hide and Seek Game"
      - stop
    - if !<player.has_flag[host]>:
      - narrate "<yellow>You are not the host, you can not end the round"
      - stop
    - if !<server.has_flag[hns_game_start]>:
      - narrate "<yellow>The game has not started"
      - stop
    - flag server hns_game_start:!
    - cast glowing remove <server.flag[seekers]>
    - narrate "<yellow><bold><player.name><&r><yellow> has ended the Hide and Seek round" targets:<server.flag[hns_narrate]>
    - flag server hiders:|:<server.flag[seekers]>
    - flag server seekers:!

hns_game_end:
  type: task
  script:
    - if !<server.has_flag[hns_game]>:
      - narrate "<yellow>There is no Hide and Seek Game"
      - stop
    - if !<player.has_flag[host]>:
      - narrate "<yellow>You are not the host, you can not stop the game"
      - stop
    - narrate "<yellow><bold><player.name><yellow> has stopped the Hide and Seek event" targets:<server.flag[hns_narrate]>
    - run stop_hns_game

hns_join:
  type: task
  script:
    - if <player.has_flag[host]>:
      - narrate "<yellow>You are the host, you can not join the game"
      - stop
    - if ( <server.has_flag[seekers]> || <server.has_flag[hiders]> ) && ( <player> in <server.flag[hiders]> || <player> in <server.flag[seekers]> ):
      - narrate "<yellow>You are already in the game"
      - stop
    - if !<server.has_flag[hns_game]>:
      - narrate "<yellow>There is no hide and seek game."
      - stop
    - if <server.has_flag[hns_game_start]>:
      - narrate "<yellow><bold><player.name><aqua> has joined the game and become a <red><bold>Seeker!" targets:<server.flag[hns_narrate]>
      - flag server seekers:->:<player>
      - cast glowing duration:10000 amplifier:255 <player>
      - narrate "<aqua>The game has already started, you have been made a <red><bold>Seeker!"
      - narrate "<red><bold>Right<red> click hiding players to mark them as found!"
      - stop
    - narrate "<yellow><bold><player.name><yellow> has joined the game and become a <dark_green><bold>Hider!" targets:<server.flag[hns_narrate]>
    - flag server hider:->:<player>
    - narrate "<aqua>You have been added to the <dark_green><bold>Hiders,<aqua> get ready to hide!"
    - flag server hns_narrate:->:<player>
    - teleport <player> <server.flag[warps.<server.flag[hns_warp].first>]>
    - narrate "<aqua> you have been teleported to <yellow><server.flag[hns_warp].first>"

hns_leave:
  type: task
  script:
    - if ( if <server.has_flag[seekers]> || <server.has_flag[hiders]> ) && ( <player> in <server.flag[hiders]> || <player> in <server.flag[seekers]> ):
      - run remove_hns_player
      - stop
    - if <player.has_flag[host]>:
      - Narrate "<yellow>You can not leave, you are the host"
      - stop
    - Narrate "<yellow>You are not in a Hide and Seek game"

hns_hiders:
  type: task
  script:
    - if !<server.has_flag[hns_game]>:
      - narrate "<yellow>There is no Hide and Seek game"
      - stop
    - if <server.has_flag[hns_game]> && <server.has_flag[hiders]> && <server.flag[hiders].size> >= 1:
      - narrate "<aqua>There are <dark_green><server.flag[hiders].size><aqua> hiders left."
      - narrate "<dark_green><bold><server.flag[hiders].formatted>"
      - stop
    - narrate "<yellow>There are no hiders"

player_leaves_server:
  type: world
  events:
    after player quit:
      - if <server.has_flag[hns_game]> && ( <server.has_flag[seekers]> || <server.has_flag[hiders]> ) && ( <player> in <server.flag[hiders]> || <player> in <server.flag[seekers]> ):
        - run remove_hns_player
      - else if <player.has_flag[host]>:
        - narrate "<yellow>The host <bold><player.name><yellow> has left the server, the Hide and Seek event has ended." targets:<server.flag[hns_narrate]>
        - run stop_hns_game

hider_hit_by_seeker:
  type: world
  events:
    after player right clicks entity:
      - if !<server.has_flag[hns_game_start]>:
        - stop
      - if <player.target> in !<server.flag[hiders]>:
        - stop
      - if <player.has_flag[host]> || ( <server.has_flag[seekers]> && <player> in <server.flag[seekers]> ):
        - Narrate "<dark_green><bold><player.target.name><aqua> has been found, they are now a <red><bold>Seeker!" targets:<server.flag[hns_narrate]>
        - narrate "<red>Right click hiding players to mark them as found!" targets:<player.target>
        - flag server hiders:<-:<player.target>
        - flag server seekers:->:<player.target>
        - cast glowing duration:10000 amplifier:255 <player.target>
        - if <server.flag[hiders].size> == 1:
          - run hider_win

remove_hns_player:
  type: task
  script:
    - narrate "<yellow><bold><player.name><yellow> has left the Hide and Seek game" targets:<server.flag[hns_narrate]>
    - cast glowing remove <player>
    - flag server hiders:<-:<player>
    - flag server seekers:<-:<player>
    - flag server hns_narrate:<-:<player>
    - if <server.has_flag[hns_game_start]> && <server.flag[hiders].size> == 1:
      - run hider_win

hider_win:
  type: task
  script:
    - narrate "<dark_green><bold><server.flag[hiders].first.name><aqua> is the last hider, they <gold><bold>WIN!" targets:<server.flag[hns_narrate]>
    - cast glowing remove <server.flag[seekers]>
    - flag server hns_game_start:!
    - flag server hider:|:<server.flag[seekers]>
    - flag server seekers:!

stop_hns_game:
  type: task
  script:
    - cast glowing remove <player>
    - cast glowing remove <server.flag[seekers]>
    - flag server hns_game:!
    - flag player host:!
    - flag server hns_game_start:!
    - flag server seekers:!
    - flag server hiders:!
    - flag server host:!
    - flag server hns_narrate:!

hns_command_error:
  type: task
  script:
    - narrate "<red>This is not a valid command. Please use /hns help to see all Hide and Seek commands"

hns_help:
  type: task
  script:
    - narrate "<gold>/hns game create|end: <yellow>Create or end a Hide and Seek event"
    - narrate "<gold>/hns round start|stop: <yellow>Start or Stop a Hide and Seek rounhd"
    - narrate "<gold>/hns join|leave: <yellow>Join or Leave a Hide and Seek event"
    - narrate "<gold>/hns hiders: <yellow>Lists the amount of hiders left and their names"
    - narrate "<gold>/hns warp: <yellow>Set the location of the Hide and Seek game"
