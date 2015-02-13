#!/bin/bash
i3-msg "workspace 2; append_layout ~/.i3/workspace_2.json"
(firefox&)
(thunderbird&)
(i3-sensible-terminal&)
