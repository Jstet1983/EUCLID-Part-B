#!/usr/bin/env python3
"""
Project EUCLID
Repository Generator

Stage 1
Core repository generator.

Future stages will populate:
- Engineering documentation
- Literature databases
- Knowledge graph
- Digital twins
- AI
- CAD
- Simulation
- Laboratory notebooks
"""

from pathlib import Path
import json
import datetime

PROJECT_NAME = "Project-EUCLID"

ROOT = Path(PROJECT_NAME)

DIRECTORIES = [

    #
    # Documentation
    #

    "docs",
    "docs/specifications",
    "docs/design",
    "docs/api",
    "docs/tutorials",
    "docs/validation",
    "docs/roadmap",
    "docs/meeting_notes",

    #
    # Literature
    #

    "papers",
    "papers/open_access",
    "papers/reviews",
    "papers/journals",
    "papers/conference",
    "papers/preprints",

    #
    # References
    #

    "references",
    "references/bibtex",
    "references/json",
    "references/csv",
    "references/doi",

    #
    # Chemistry
    #

    "chemistry",
    "chemistry/organic",
    "chemistry/inorganic",
    "chemistry/electrochemistry",
    "chemistry/catalysis",
    "chemistry/plasma",
    "chemistry/photochemistry",
    "chemistry/surface",
    "chemistry/analytical",

    #
    # Physics
    #

    "physics",
    "physics/thermodynamics",
    "physics/quantum",
    "physics/electromagnetics",
    "physics/plasma",
    "physics/fluid_dynamics",

    #
    # Engineering
    #

    "engineering",
    "engineering/mechanical",
    "engineering/electrical",
    "engineering/chemical",
    "engineering/materials",
    "engineering/process",
    "engineering/control",
    "engineering/manufacturing",

    #
    # Manufacturing
    #

    "manufacturing",
    "manufacturing/molecular",
    "manufacturing/plasma",
    "manufacturing/laser",
    "manufacturing/electrochemical",
    "manufacturing/additive",
    "manufacturing/cnc",

    #
    # Simulation
    #

    "simulation",
    "simulation/python",
    "simulation/cfd",
    "simulation/fem",
    "simulation/spice",
    "simulation/digital_twins",

    #
    # AI
    #

    "ai",
    "ai/prompts",
    "ai/rag",
    "ai/models",
    "ai/embeddings",
    "ai/knowledge_graph",

    #
    # Laboratory
    #

    "laboratory",
    "laboratory/notebooks",
    "laboratory/protocols",
    "laboratory/calibration",
    "laboratory/results",

    #
    # Software
    #

    "software",
    "software/python",
    "software/cpp",
    "software/rust",
    "software/go",
    "software/web",

    #
    # Hardware
    #

    "hardware",
    "hardware/electronics",
    "hardware/sensors",
    "hardware/power",
    "hardware/controllers",

    #
    # Data
    #

    "datasets",
    "images",
    "videos",
    "cad",
    "models",
    "scripts",
    "tools",
    "archive",
]

README = """# Project EUCLID

Universal Engineering and Molecular Manufacturing Platform

Generated automatically.

## Domains

- Chemistry
- Physics
- Electrochemistry
- Manufacturing
- Robotics
- AI
- Digital Twins
- CAD
- Simulation
- Automation
"""

def write(path: Path, text: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")

def create_directories():
    for d in DIRECTORIES:
        (ROOT / d).mkdir(parents=True, exist_ok=True)

def create_root_files():
    write(ROOT / "README.md", README)

    write(
        ROOT / "project.json",
        json.dumps(
            {
                "name": PROJECT_NAME,
                "created": datetime.datetime.utcnow().isoformat(),
                "version": "0.1.0",
                "generator": "generate_euclid.py",
            },
            indent=2,
        ),
    )

    write(
        ROOT / ".gitignore",
        """__pycache__/
*.pyc
*.log
*.tmp
.env
""",
    )

def main():
    print(f"Creating {PROJECT_NAME}")
    ROOT.mkdir(exist_ok=True)

    create_directories()
    create_root_files()

    print("Stage 1 complete.")

if __name__ == "__main__":
    main()
