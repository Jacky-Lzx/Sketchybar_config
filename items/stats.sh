sketchybar -m --add item cpu_label right \
              --set cpu_label \
                    label=CPU \
                    y_offset=5 \
                    width=0 \
              --add item cpu_percent right \
              --set cpu_percent \
                    y_offset=-4 \
                    update_freq=3 \
                    script="~/.config/sketchybar/plugins/cpu.sh"

sketchybar -m --add item ram_label right \
              --set ram_label \
                               label=RAM \
                               y_offset=5 \
                               width=0 \
\
              --add item ram_percentage right \
              --set ram_percentage \
                                    y_offset=-4 \
                                    update_freq=1 \
                                    script="~/.config/sketchybar/plugins/ram.sh"

sketchybar -m --add item network_up right \
              --set network_up \
                               icon= \
                               icon.highlight_color=0xff8b0a0d \
                               y_offset=5 \
                               width=0 \
                               update_freq=1 \
                               script="~/.config/sketchybar/plugins/network.sh" \
              --add item network_down right \
              --set network_down \
                                 icon= \
                                 icon.highlight_color=0xff10528c \
                                 y_offset=-4 \
                                 update_freq=1

sketchybar -m --add item vpn right \
              --set vpn icon= \
                        icon.color=0xffA3BE8C \
                        update_freq=5 \
                        script="~/.config/sketchybar/plugins/vpn.sh"
