#!/usr/bin/env bash
set -e

mkdir -p research

touch research/hypotheses.md
touch research/experiments.md
touch research/simulations.md
touch research/publications.md
touch research/backlog.md

case "$1" in
new-hypothesis)
echo -e "\n## $(date)\n\nTitle: $2\n\nDescription:\n\nStatus: Proposed\n" >> research/hypotheses.md
;;

new-experiment)
echo -e "\n## $(date)\n\nExperiment: $2\n\nObjective:\n\nMeasurements:\n\nExpected Outcome:\n" >> research/experiments.md
;;

new-simulation)
echo -e "\n## $(date)\n\nSimulation: $2\n\nInputs:\n\nOutputs:\n\nStatus: Planned\n" >> research/simulations.md
;;

backlog)
cat research/backlog.md
;;

list)
find research -type f
;;

*)
echo "Usage:"
echo "./research.sh new-hypothesis \"Title\""
echo "./research.sh new-experiment \"Title\""
echo "./research.sh new-simulation \"Title\""
echo "./research.sh backlog"
echo "./research.sh list"
;;
esac
