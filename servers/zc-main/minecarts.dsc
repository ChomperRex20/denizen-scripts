# Protects our server from massive lag when people stack tnt minecarts
tnt_minecart_events:
  type: world
  debug: false
  events:
    on minecart_tnt collides with minecart_tnt:
      - if <context.vehicle.entity_type||null> == minecart_tnt && <context.entity.entity_type||null> == minecart_tnt:
        - remove <context.entity>
    on minecart collides with minecart:
      - ratelimit <context.vehicle> 1t
      - if !<context.vehicle.is_spawned||false>:
        - stop
      - define entities <context.vehicle.location.find_entities[minecart].within[0.05].exclude[<context.vehicle>]||<list>>
      - if !<[entities].is_empty>:
        - remove <[entities]>
