--- !ruby/object:Minesweeper
name: Walter
moves: 1
flags: 0
bombs: 5
board: &1 !ruby/object:Board
  board:
  - - &2 !ruby/object:Tile
      bomb: false
      board: *1
      position:
      - 0
      - 0
      value: 0
      revealed: true
      flagged: false
      neighbors:
      - &3 !ruby/object:Tile
        bomb: false
        board: *1
        position:
        - 0
        - 1
        value: 0
        revealed: true
        flagged: false
        neighbors:
        - *2
        - &4 !ruby/object:Tile
          bomb: false
          board: *1
          position:
          - 0
          - 2
          value: 0
          revealed: true
          flagged: false
          neighbors:
          - *3
          - &5 !ruby/object:Tile
            bomb: false
            board: *1
            position:
            - 0
            - 3
            value: 0
            revealed: true
            flagged: false
            neighbors:
            - *4
            - &71 !ruby/object:Tile
              bomb: false
              board: *1
              position:
              - 0
              - 4
              value: 1
              revealed: true
              flagged: false
              neighbors:
              - *5
              - &72 !ruby/object:Tile
                bomb: true
                board: *1
                position:
                - 0
                - 5
                value: "-"
                revealed: false
                flagged: false
              - &69 !ruby/object:Tile
                bomb: false
                board: *1
                position:
                - 1
                - 3
                value: 0
                revealed: true
                flagged: false
                neighbors:
                - &80 !ruby/object:Tile
                  bomb: false
                  board: *1
                  position:
                  - 1
                  - 2
                  value: 0
                  revealed: true
                  flagged: false
                  neighbors:
                  - &6 !ruby/object:Tile
                    bomb: false
                    board: *1
                    position:
                    - 1
                    - 1
                    value: 0
                    revealed: true
                    flagged: false
                    neighbors:
                    - &82 !ruby/object:Tile
                      bomb: false
                      board: *1
                      position:
                      - 1
                      - 0
                      value: 0
                      revealed: true
                      flagged: false
                      neighbors:
                      - *6
                      - &7 !ruby/object:Tile
                        bomb: false
                        board: *1
                        position:
                        - 2
                        - 0
                        value: 0
                        revealed: true
                        flagged: false
                        neighbors:
                        - &8 !ruby/object:Tile
                          bomb: false
                          board: *1
                          position:
                          - 2
                          - 1
                          value: 0
                          revealed: true
                          flagged: false
                          neighbors:
                          - *7
                          - &9 !ruby/object:Tile
                            bomb: false
                            board: *1
                            position:
                            - 2
                            - 2
                            value: 0
                            revealed: true
                            flagged: false
                            neighbors:
                            - *8
                            - &10 !ruby/object:Tile
                              bomb: false
                              board: *1
                              position:
                              - 2
                              - 3
                              value: 0
                              revealed: true
                              flagged: false
                              neighbors:
                              - *9
                              - &11 !ruby/object:Tile
                                bomb: false
                                board: *1
                                position:
                                - 2
                                - 4
                                value: 0
                                revealed: true
                                flagged: false
                                neighbors:
                                - *10
                                - &12 !ruby/object:Tile
                                  bomb: false
                                  board: *1
                                  position:
                                  - 2
                                  - 5
                                  value: 0
                                  revealed: true
                                  flagged: false
                                  neighbors:
                                  - *11
                                  - &13 !ruby/object:Tile
                                    bomb: false
                                    board: *1
                                    position:
                                    - 2
                                    - 6
                                    value: 0
                                    revealed: true
                                    flagged: false
                                    neighbors:
                                    - *12
                                    - &14 !ruby/object:Tile
                                      bomb: false
                                      board: *1
                                      position:
                                      - 2
                                      - 7
                                      value: 0
                                      revealed: true
                                      flagged: false
                                      neighbors:
                                      - *13
                                      - &63 !ruby/object:Tile
                                        bomb: false
                                        board: *1
                                        position:
                                        - 2
                                        - 8
                                        value: 0
                                        revealed: true
                                        flagged: false
                                        neighbors:
                                        - *14
                                        - &62 !ruby/object:Tile
                                          bomb: false
                                          board: *1
                                          position:
                                          - 3
                                          - 7
                                          value: 0
                                          revealed: true
                                          flagged: false
                                          neighbors:
                                          - &64 !ruby/object:Tile
                                            bomb: false
                                            board: *1
                                            position:
                                            - 3
                                            - 6
                                            value: 0
                                            revealed: true
                                            flagged: false
                                            neighbors:
                                            - &66 !ruby/object:Tile
                                              bomb: false
                                              board: *1
                                              position:
                                              - 3
                                              - 5
                                              value: 0
                                              revealed: true
                                              flagged: false
                                              neighbors:
                                              - &67 !ruby/object:Tile
                                                bomb: false
                                                board: *1
                                                position:
                                                - 3
                                                - 4
                                                value: 0
                                                revealed: true
                                                flagged: false
                                                neighbors:
                                                - &68 !ruby/object:Tile
                                                  bomb: false
                                                  board: *1
                                                  position:
                                                  - 3
                                                  - 3
                                                  value: 0
                                                  revealed: true
                                                  flagged: false
                                                  neighbors:
                                                  - &16 !ruby/object:Tile
                                                    bomb: false
                                                    board: *1
                                                    position:
                                                    - 3
                                                    - 2
                                                    value: 1
                                                    revealed: true
                                                    flagged: false
                                                    neighbors:
                                                    - &15 !ruby/object:Tile
                                                      bomb: false
                                                      board: *1
                                                      position:
                                                      - 3
                                                      - 1
                                                      value: 1
                                                      revealed: true
                                                      flagged: false
                                                      neighbors:
                                                      - &81 !ruby/object:Tile
                                                        bomb: false
                                                        board: *1
                                                        position:
                                                        - 3
                                                        - 0
                                                        value: 1
                                                        revealed: true
                                                        flagged: false
                                                        neighbors:
                                                        - *15
                                                        - &17 !ruby/object:Tile
                                                          bomb: false
                                                          board: *1
                                                          position:
                                                          - 4
                                                          - 0
                                                          value: "-"
                                                          revealed: false
                                                          flagged: false
                                                        - &18 !ruby/object:Tile
                                                          bomb: true
                                                          board: *1
                                                          position:
                                                          - 4
                                                          - 1
                                                          value: "-"
                                                          revealed: false
                                                          flagged: false
                                                        - *7
                                                        - *8
                                                      - *16
                                                      - *17
                                                      - *18
                                                      - &19 !ruby/object:Tile
                                                        bomb: false
                                                        board: *1
                                                        position:
                                                        - 4
                                                        - 2
                                                        value: 2
                                                        revealed: true
                                                        flagged: false
                                                        neighbors:
                                                        - *18
                                                        - &20 !ruby/object:Tile
                                                          bomb: false
                                                          board: *1
                                                          position:
                                                          - 4
                                                          - 3
                                                          value: 1
                                                          revealed: true
                                                          flagged: false
                                                          neighbors:
                                                          - *19
                                                          - &21 !ruby/object:Tile
                                                            bomb: false
                                                            board: *1
                                                            position:
                                                            - 4
                                                            - 4
                                                            value: 0
                                                            revealed: true
                                                            flagged: false
                                                            neighbors:
                                                            - *20
                                                            - &22 !ruby/object:Tile
                                                              bomb: false
                                                              board: *1
                                                              position:
                                                              - 4
                                                              - 5
                                                              value: 0
                                                              revealed: true
                                                              flagged: false
                                                              neighbors:
                                                              - *21
                                                              - &23 !ruby/object:Tile
                                                                bomb: false
                                                                board: *1
                                                                position:
                                                                - 4
                                                                - 6
                                                                value: 0
                                                                revealed: true
                                                                flagged: false
                                                                neighbors:
                                                                - *22
                                                                - &24 !ruby/object:Tile
                                                                  bomb: false
                                                                  board: *1
                                                                  position:
                                                                  - 4
                                                                  - 7
                                                                  value: 0
                                                                  revealed: true
                                                                  flagged: false
                                                                  neighbors:
                                                                  - *23
                                                                  - &52 !ruby/object:Tile
                                                                    bomb: false
                                                                    board: *1
                                                                    position:
                                                                    - 4
                                                                    - 8
                                                                    value: 0
                                                                    revealed: true
                                                                    flagged: false
                                                                    neighbors:
                                                                    - *24
                                                                    - &50 !ruby/object:Tile
                                                                      bomb: false
                                                                      board: *1
                                                                      position:
                                                                      - 5
                                                                      - 7
                                                                      value: 0
                                                                      revealed: true
                                                                      flagged: false
                                                                      neighbors:
                                                                      - &48 !ruby/object:Tile
                                                                        bomb: false
                                                                        board: *1
                                                                        position:
                                                                        - 5
                                                                        - 6
                                                                        value: 0
                                                                        revealed: true
                                                                        flagged: false
                                                                        neighbors:
                                                                        - &46 !ruby/object:Tile
                                                                          bomb: false
                                                                          board: *1
                                                                          position:
                                                                          - 5
                                                                          - 5
                                                                          value: 0
                                                                          revealed: true
                                                                          flagged: false
                                                                          neighbors:
                                                                          - &25 !ruby/object:Tile
                                                                            bomb: false
                                                                            board: *1
                                                                            position:
                                                                            - 5
                                                                            - 4
                                                                            value: 1
                                                                            revealed: true
                                                                            flagged: false
                                                                            neighbors:
                                                                            - &45 !ruby/object:Tile
                                                                              bomb: false
                                                                              board: *1
                                                                              position:
                                                                              - 5
                                                                              - 3
                                                                              value: 2
                                                                              revealed: true
                                                                              flagged: false
                                                                              neighbors:
                                                                              - &60 !ruby/object:Tile
                                                                                bomb: true
                                                                                board: *1
                                                                                position:
                                                                                - 5
                                                                                - 2
                                                                                value: "-"
                                                                                revealed: false
                                                                                flagged: false
                                                                              - *25
                                                                              - &56 !ruby/object:Tile
                                                                                bomb: false
                                                                                board: *1
                                                                                position:
                                                                                - 6
                                                                                - 2
                                                                                value: 2
                                                                                revealed: true
                                                                                flagged: false
                                                                                neighbors:
                                                                                - &26 !ruby/object:Tile
                                                                                  bomb: false
                                                                                  board: *1
                                                                                  position:
                                                                                  - 6
                                                                                  - 1
                                                                                  value: 1
                                                                                  revealed: true
                                                                                  flagged: false
                                                                                  neighbors:
                                                                                  - &58 !ruby/object:Tile
                                                                                    bomb: false
                                                                                    board: *1
                                                                                    position:
                                                                                    - 6
                                                                                    - 0
                                                                                    value: 0
                                                                                    revealed: true
                                                                                    flagged: false
                                                                                    neighbors:
                                                                                    - *26
                                                                                    - &27 !ruby/object:Tile
                                                                                      bomb: false
                                                                                      board: *1
                                                                                      position:
                                                                                      - 7
                                                                                      - 0
                                                                                      value: 0
                                                                                      revealed: true
                                                                                      flagged: false
                                                                                      neighbors:
                                                                                      - &28 !ruby/object:Tile
                                                                                        bomb: false
                                                                                        board: *1
                                                                                        position:
                                                                                        - 7
                                                                                        - 1
                                                                                        value: 0
                                                                                        revealed: true
                                                                                        flagged: false
                                                                                        neighbors:
                                                                                        - *27
                                                                                        - &29 !ruby/object:Tile
                                                                                          bomb: false
                                                                                          board: *1
                                                                                          position:
                                                                                          - 7
                                                                                          - 2
                                                                                          value: 1
                                                                                          revealed: true
                                                                                          flagged: false
                                                                                          neighbors:
                                                                                          - *28
                                                                                          - &30 !ruby/object:Tile
                                                                                            bomb: false
                                                                                            board: *1
                                                                                            position:
                                                                                            - 7
                                                                                            - 3
                                                                                            value: 1
                                                                                            revealed: true
                                                                                            flagged: false
                                                                                            neighbors:
                                                                                            - *29
                                                                                            - &31 !ruby/object:Tile
                                                                                              bomb: false
                                                                                              board: *1
                                                                                              position:
                                                                                              - 7
                                                                                              - 4
                                                                                              value: 1
                                                                                              revealed: true
                                                                                              flagged: false
                                                                                              neighbors:
                                                                                              - *30
                                                                                              - &32 !ruby/object:Tile
                                                                                                bomb: false
                                                                                                board: *1
                                                                                                position:
                                                                                                - 7
                                                                                                - 5
                                                                                                value: 0
                                                                                                revealed: true
                                                                                                flagged: false
                                                                                                neighbors:
                                                                                                - *31
                                                                                                - &33 !ruby/object:Tile
                                                                                                  bomb: false
                                                                                                  board: *1
                                                                                                  position:
                                                                                                  - 7
                                                                                                  - 6
                                                                                                  value: 0
                                                                                                  revealed: true
                                                                                                  flagged: false
                                                                                                  neighbors:
                                                                                                  - *32
                                                                                                  - &34 !ruby/object:Tile
                                                                                                    bomb: false
                                                                                                    board: *1
                                                                                                    position:
                                                                                                    - 7
                                                                                                    - 7
                                                                                                    value: 0
                                                                                                    revealed: true
                                                                                                    flagged: false
                                                                                                    neighbors:
                                                                                                    - *33
                                                                                                    - &42 !ruby/object:Tile
                                                                                                      bomb: false
                                                                                                      board: *1
                                                                                                      position:
                                                                                                      - 7
                                                                                                      - 8
                                                                                                      value: 0
                                                                                                      revealed: true
                                                                                                      flagged: false
                                                                                                      neighbors:
                                                                                                      - *34
                                                                                                      - &41 !ruby/object:Tile
                                                                                                        bomb: false
                                                                                                        board: *1
                                                                                                        position:
                                                                                                        - 8
                                                                                                        - 7
                                                                                                        value: 0
                                                                                                        revealed: true
                                                                                                        flagged: false
                                                                                                        neighbors:
                                                                                                        - &40 !ruby/object:Tile
                                                                                                          bomb: false
                                                                                                          board: *1
                                                                                                          position:
                                                                                                          - 8
                                                                                                          - 6
                                                                                                          value: 0
                                                                                                          revealed: true
                                                                                                          flagged: false
                                                                                                          neighbors:
                                                                                                          - &39 !ruby/object:Tile
                                                                                                            bomb: false
                                                                                                            board: *1
                                                                                                            position:
                                                                                                            - 8
                                                                                                            - 5
                                                                                                            value: 0
                                                                                                            revealed: true
                                                                                                            flagged: false
                                                                                                            neighbors:
                                                                                                            - &38 !ruby/object:Tile
                                                                                                              bomb: false
                                                                                                              board: *1
                                                                                                              position:
                                                                                                              - 8
                                                                                                              - 4
                                                                                                              value: 0
                                                                                                              revealed: true
                                                                                                              flagged: false
                                                                                                              neighbors:
                                                                                                              - &37 !ruby/object:Tile
                                                                                                                bomb: false
                                                                                                                board: *1
                                                                                                                position:
                                                                                                                - 8
                                                                                                                - 3
                                                                                                                value: 0
                                                                                                                revealed: true
                                                                                                                flagged: false
                                                                                                                neighbors:
                                                                                                                - &36 !ruby/object:Tile
                                                                                                                  bomb: false
                                                                                                                  board: *1
                                                                                                                  position:
                                                                                                                  - 8
                                                                                                                  - 2
                                                                                                                  value: 0
                                                                                                                  revealed: true
                                                                                                                  flagged: false
                                                                                                                  neighbors:
                                                                                                                  - &35 !ruby/object:Tile
                                                                                                                    bomb: false
                                                                                                                    board: *1
                                                                                                                    position:
                                                                                                                    - 8
                                                                                                                    - 1
                                                                                                                    value: 0
                                                                                                                    revealed: true
                                                                                                                    flagged: false
                                                                                                                    neighbors:
                                                                                                                    - &57 !ruby/object:Tile
                                                                                                                      bomb: false
                                                                                                                      board: *1
                                                                                                                      position:
                                                                                                                      - 8
                                                                                                                      - 0
                                                                                                                      value: 0
                                                                                                                      revealed: true
                                                                                                                      flagged: false
                                                                                                                      neighbors:
                                                                                                                      - *35
                                                                                                                      - *27
                                                                                                                      - *28
                                                                                                                    - *36
                                                                                                                    - *27
                                                                                                                    - *28
                                                                                                                    - *29
                                                                                                                  - *37
                                                                                                                  - *28
                                                                                                                  - *29
                                                                                                                  - *30
                                                                                                                - *38
                                                                                                                - *29
                                                                                                                - *30
                                                                                                                - *31
                                                                                                              - *39
                                                                                                              - *30
                                                                                                              - *31
                                                                                                              - *32
                                                                                                            - *40
                                                                                                            - *31
                                                                                                            - *32
                                                                                                            - *33
                                                                                                          - *41
                                                                                                          - *32
                                                                                                          - *33
                                                                                                          - *34
                                                                                                        - &43 !ruby/object:Tile
                                                                                                          bomb: false
                                                                                                          board: *1
                                                                                                          position:
                                                                                                          - 8
                                                                                                          - 8
                                                                                                          value: 0
                                                                                                          revealed: true
                                                                                                          flagged: false
                                                                                                          neighbors:
                                                                                                          - *41
                                                                                                          - *34
                                                                                                          - *42
                                                                                                        - *33
                                                                                                        - *34
                                                                                                        - *42
                                                                                                      - *43
                                                                                                      - &49 !ruby/object:Tile
                                                                                                        bomb: false
                                                                                                        board: *1
                                                                                                        position:
                                                                                                        - 6
                                                                                                        - 7
                                                                                                        value: 0
                                                                                                        revealed: true
                                                                                                        flagged: false
                                                                                                        neighbors:
                                                                                                        - &47 !ruby/object:Tile
                                                                                                          bomb: false
                                                                                                          board: *1
                                                                                                          position:
                                                                                                          - 6
                                                                                                          - 6
                                                                                                          value: 0
                                                                                                          revealed: true
                                                                                                          flagged: false
                                                                                                          neighbors:
                                                                                                          - &44 !ruby/object:Tile
                                                                                                            bomb: false
                                                                                                            board: *1
                                                                                                            position:
                                                                                                            - 6
                                                                                                            - 5
                                                                                                            value: 0
                                                                                                            revealed: true
                                                                                                            flagged: false
                                                                                                            neighbors:
                                                                                                            - &54 !ruby/object:Tile
                                                                                                              bomb: false
                                                                                                              board: *1
                                                                                                              position:
                                                                                                              - 6
                                                                                                              - 4
                                                                                                              value: 1
                                                                                                              revealed: true
                                                                                                              flagged: false
                                                                                                              neighbors:
                                                                                                              - &55 !ruby/object:Tile
                                                                                                                bomb: true
                                                                                                                board: *1
                                                                                                                position:
                                                                                                                - 6
                                                                                                                - 3
                                                                                                                value: "-"
                                                                                                                revealed: false
                                                                                                                flagged: false
                                                                                                              - *44
                                                                                                              - *30
                                                                                                              - *31
                                                                                                              - *32
                                                                                                              - *45
                                                                                                              - *25
                                                                                                              - *46
                                                                                                            - *47
                                                                                                            - *31
                                                                                                            - *32
                                                                                                            - *33
                                                                                                            - *25
                                                                                                            - *46
                                                                                                            - *48
                                                                                                          - *49
                                                                                                          - *32
                                                                                                          - *33
                                                                                                          - *34
                                                                                                          - *46
                                                                                                          - *48
                                                                                                          - *50
                                                                                                        - &51 !ruby/object:Tile
                                                                                                          bomb: false
                                                                                                          board: *1
                                                                                                          position:
                                                                                                          - 6
                                                                                                          - 8
                                                                                                          value: 0
                                                                                                          revealed: true
                                                                                                          flagged: false
                                                                                                          neighbors:
                                                                                                          - *49
                                                                                                          - *34
                                                                                                          - *42
                                                                                                          - *50
                                                                                                          - &53 !ruby/object:Tile
                                                                                                            bomb: false
                                                                                                            board: *1
                                                                                                            position:
                                                                                                            - 5
                                                                                                            - 8
                                                                                                            value: 0
                                                                                                            revealed: true
                                                                                                            flagged: false
                                                                                                            neighbors:
                                                                                                            - *50
                                                                                                            - *49
                                                                                                            - *51
                                                                                                            - *24
                                                                                                            - *52
                                                                                                        - *33
                                                                                                        - *34
                                                                                                        - *42
                                                                                                        - *48
                                                                                                        - *50
                                                                                                        - *53
                                                                                                      - *51
                                                                                                    - *40
                                                                                                    - *41
                                                                                                    - *43
                                                                                                    - *47
                                                                                                    - *49
                                                                                                    - *51
                                                                                                  - *39
                                                                                                  - *40
                                                                                                  - *41
                                                                                                  - *44
                                                                                                  - *47
                                                                                                  - *49
                                                                                                - *38
                                                                                                - *39
                                                                                                - *40
                                                                                                - *54
                                                                                                - *44
                                                                                                - *47
                                                                                              - *37
                                                                                              - *38
                                                                                              - *39
                                                                                              - *55
                                                                                              - *54
                                                                                              - *44
                                                                                            - *36
                                                                                            - *37
                                                                                            - *38
                                                                                            - *56
                                                                                            - *55
                                                                                            - *54
                                                                                          - *35
                                                                                          - *36
                                                                                          - *37
                                                                                          - *26
                                                                                          - *56
                                                                                          - *55
                                                                                        - *57
                                                                                        - *35
                                                                                        - *36
                                                                                        - *58
                                                                                        - *26
                                                                                        - *56
                                                                                      - *57
                                                                                      - *35
                                                                                      - *58
                                                                                      - *26
                                                                                    - *28
                                                                                    - &59 !ruby/object:Tile
                                                                                      bomb: false
                                                                                      board: *1
                                                                                      position:
                                                                                      - 5
                                                                                      - 0
                                                                                      value: 1
                                                                                      revealed: true
                                                                                      flagged: false
                                                                                      neighbors:
                                                                                      - &61 !ruby/object:Tile
                                                                                        bomb: false
                                                                                        board: *1
                                                                                        position:
                                                                                        - 5
                                                                                        - 1
                                                                                        value: 2
                                                                                        revealed: true
                                                                                        flagged: false
                                                                                        neighbors:
                                                                                        - *59
                                                                                        - *60
                                                                                        - *58
                                                                                        - *26
                                                                                        - *56
                                                                                        - *17
                                                                                        - *18
                                                                                        - *19
                                                                                      - *58
                                                                                      - *26
                                                                                      - *17
                                                                                      - *18
                                                                                    - *61
                                                                                  - *56
                                                                                  - *27
                                                                                  - *28
                                                                                  - *29
                                                                                  - *59
                                                                                  - *61
                                                                                  - *60
                                                                                - *55
                                                                                - *28
                                                                                - *29
                                                                                - *30
                                                                                - *61
                                                                                - *60
                                                                                - *45
                                                                              - *55
                                                                              - *54
                                                                              - *19
                                                                              - *20
                                                                              - *21
                                                                            - *46
                                                                            - *55
                                                                            - *54
                                                                            - *44
                                                                            - *20
                                                                            - *21
                                                                            - *22
                                                                          - *48
                                                                          - *54
                                                                          - *44
                                                                          - *47
                                                                          - *21
                                                                          - *22
                                                                          - *23
                                                                        - *50
                                                                        - *44
                                                                        - *47
                                                                        - *49
                                                                        - *22
                                                                        - *23
                                                                        - *24
                                                                      - *53
                                                                      - *47
                                                                      - *49
                                                                      - *51
                                                                      - *23
                                                                      - *24
                                                                      - *52
                                                                    - *53
                                                                    - *62
                                                                    - &65 !ruby/object:Tile
                                                                      bomb: false
                                                                      board: *1
                                                                      position:
                                                                      - 3
                                                                      - 8
                                                                      value: 0
                                                                      revealed: true
                                                                      flagged: false
                                                                      neighbors:
                                                                      - *62
                                                                      - *24
                                                                      - *52
                                                                      - *14
                                                                      - *63
                                                                  - *48
                                                                  - *50
                                                                  - *53
                                                                  - *64
                                                                  - *62
                                                                  - *65
                                                                - *46
                                                                - *48
                                                                - *50
                                                                - *66
                                                                - *64
                                                                - *62
                                                              - *25
                                                              - *46
                                                              - *48
                                                              - *67
                                                              - *66
                                                              - *64
                                                            - *45
                                                            - *25
                                                            - *46
                                                            - *68
                                                            - *67
                                                            - *66
                                                          - *60
                                                          - *45
                                                          - *25
                                                          - *16
                                                          - *68
                                                          - *67
                                                        - *61
                                                        - *60
                                                        - *45
                                                        - *15
                                                        - *16
                                                        - *68
                                                      - *7
                                                      - *8
                                                      - *9
                                                    - *68
                                                    - *18
                                                    - *19
                                                    - *20
                                                    - *8
                                                    - *9
                                                    - *10
                                                  - *67
                                                  - *19
                                                  - *20
                                                  - *21
                                                  - *9
                                                  - *10
                                                  - *11
                                                - *66
                                                - *20
                                                - *21
                                                - *22
                                                - *10
                                                - *11
                                                - *12
                                              - *64
                                              - *21
                                              - *22
                                              - *23
                                              - *11
                                              - *12
                                              - *13
                                            - *62
                                            - *22
                                            - *23
                                            - *24
                                            - *12
                                            - *13
                                            - *14
                                          - *65
                                          - *23
                                          - *24
                                          - *52
                                          - *13
                                          - *14
                                          - *63
                                        - *65
                                        - &74 !ruby/object:Tile
                                          bomb: false
                                          board: *1
                                          position:
                                          - 1
                                          - 7
                                          value: 1
                                          revealed: true
                                          flagged: false
                                          neighbors:
                                          - &73 !ruby/object:Tile
                                            bomb: false
                                            board: *1
                                            position:
                                            - 1
                                            - 6
                                            value: 1
                                            revealed: true
                                            flagged: false
                                            neighbors:
                                            - &70 !ruby/object:Tile
                                              bomb: false
                                              board: *1
                                              position:
                                              - 1
                                              - 5
                                              value: 1
                                              revealed: true
                                              flagged: false
                                              neighbors:
                                              - &79 !ruby/object:Tile
                                                bomb: false
                                                board: *1
                                                position:
                                                - 1
                                                - 4
                                                value: 1
                                                revealed: true
                                                flagged: false
                                                neighbors:
                                                - *69
                                                - *70
                                                - *10
                                                - *11
                                                - *12
                                                - *5
                                                - *71
                                                - *72
                                              - *73
                                              - *11
                                              - *12
                                              - *13
                                              - *71
                                              - *72
                                              - &75 !ruby/object:Tile
                                                bomb: false
                                                board: *1
                                                position:
                                                - 0
                                                - 6
                                                value: "-"
                                                revealed: false
                                                flagged: false
                                            - *74
                                            - *12
                                            - *13
                                            - *14
                                            - *72
                                            - *75
                                            - &76 !ruby/object:Tile
                                              bomb: false
                                              board: *1
                                              position:
                                              - 0
                                              - 7
                                              value: "-"
                                              revealed: false
                                              flagged: false
                                          - &78 !ruby/object:Tile
                                            bomb: false
                                            board: *1
                                            position:
                                            - 1
                                            - 8
                                            value: 1
                                            revealed: true
                                            flagged: false
                                            neighbors:
                                            - *74
                                            - *14
                                            - *63
                                            - *76
                                            - &77 !ruby/object:Tile
                                              bomb: true
                                              board: *1
                                              position:
                                              - 0
                                              - 8
                                              value: "-"
                                              revealed: false
                                              flagged: false
                                          - *13
                                          - *14
                                          - *63
                                          - *75
                                          - *76
                                          - *77
                                        - *78
                                      - *64
                                      - *62
                                      - *65
                                      - *73
                                      - *74
                                      - *78
                                    - *66
                                    - *64
                                    - *62
                                    - *70
                                    - *73
                                    - *74
                                  - *67
                                  - *66
                                  - *64
                                  - *79
                                  - *70
                                  - *73
                                - *68
                                - *67
                                - *66
                                - *69
                                - *79
                                - *70
                              - *16
                              - *68
                              - *67
                              - *80
                              - *69
                              - *79
                            - *15
                            - *16
                            - *68
                            - *6
                            - *80
                            - *69
                          - *81
                          - *15
                          - *16
                          - *82
                          - *6
                          - *80
                        - *81
                        - *15
                        - *82
                        - *6
                      - *8
                      - *2
                      - *3
                    - *80
                    - *7
                    - *8
                    - *9
                    - *2
                    - *3
                    - *4
                  - *69
                  - *8
                  - *9
                  - *10
                  - *3
                  - *4
                  - *5
                - *79
                - *9
                - *10
                - *11
                - *4
                - *5
                - *71
              - *79
              - *70
            - *80
            - *69
            - *79
          - *6
          - *80
          - *69
        - *82
        - *6
        - *80
      - *82
      - *6
    - *3
    - *4
    - *5
    - *71
    - *72
    - *75
    - *76
    - *77
  - - *82
    - *6
    - *80
    - *69
    - *79
    - *70
    - *73
    - *74
    - *78
  - - *7
    - *8
    - *9
    - *10
    - *11
    - *12
    - *13
    - *14
    - *63
  - - *81
    - *15
    - *16
    - *68
    - *67
    - *66
    - *64
    - *62
    - *65
  - - *17
    - *18
    - *19
    - *20
    - *21
    - *22
    - *23
    - *24
    - *52
  - - *59
    - *61
    - *60
    - *45
    - *25
    - *46
    - *48
    - *50
    - *53
  - - *58
    - *26
    - *56
    - *55
    - *54
    - *44
    - *47
    - *49
    - *51
  - - *27
    - *28
    - *29
    - *30
    - *31
    - *32
    - *33
    - *34
    - *42
  - - *57
    - *35
    - *36
    - *37
    - *38
    - *39
    - *40
    - *41
    - *43
  bombs:
  - - 0
    - 5
  - - 5
    - 2
  - - 4
    - 1
  - - 0
    - 8
  - - 6
    - 3
  flags: []
