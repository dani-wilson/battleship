# battleship
# 1. Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process."

# - We pseudo-coded(mostly verbally) to try to work out how the game needed to flow and the steps we would need to take in order to make that happen. We decided to make our gameplay class more robust with a slimmer runner file and chained methods within other methods. It was also useful to visually see what the board should look like and try to work out how to get it to look like that from the visual. 

# -In lieu of a robust spec file, we relied mostly on trial and error on the runner to make sure our game was working and troubleshoot/debug from there.

# 2. If you had one more day to work on this project, what would you work on?

# We discovered an edge case during game testing of the user placement of the Submarine. If first coordinate was placed on an occupied ship, it wouldn't allow placement; however, when we placed the first coordinate on an empty cell and the second coordinate on an occupied cell, it somehow registered the placement as valid when it shouldn't have been. This results in overlapping ships on the user's board.
# We followed stack trace to find the issue, but ran out of time to fully follow through and remedy the issue.
# It would have also been nice to have more time to work on intelligent computer.

# 3. Describe the pairing techniques you used while working on this project.

# We used the Ping Pong Pairing method during live sessions, and had a few Async sessions where we kept in touch via Slack.

# 4. Describe how feedback was shared over the course of this project.

# We mostly shared technical feedback as we went along in our live pairing sessions and over Slack. We also made sure to review and comment each PR before merging on GitHub.
