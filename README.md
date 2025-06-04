# Media Platform Context Network

This project is a specialized template for creating context networks focused on media platform development and management. It provides a structured framework for planning, developing, and maintaining media platforms while preserving key decisions, design patterns, and organizational knowledge.

## Purpose

This template is designed to support projects where teams need to:

1. **Define Platform Strategy**: Document core purpose, content types, distribution methods, and business models
2. **Plan Platform Architecture**: Capture technical decisions, system design, and integration patterns
3. **Manage Content Strategy**: Track content types, workflows, and distribution channels
4. **Document User Experience**: Record user journeys, interface patterns, and engagement models
5. **Track Business Rules**: Maintain pricing models, access controls, and monetization strategies

The template is particularly useful for:

- Content publishing platforms
- Media streaming services
- Digital learning platforms
- Community engagement platforms
- Content marketplace systems

## Getting Started

1. **Initial Setup**:
   - Clone this template repository
   - Navigate to the `setup/` directory
   - Follow the questionnaire in `setup/questionnaire/` to define your platform:
     - Core purpose and goals (`01_core_purpose.md`)
     - Content types and formats (`02_content_types.md`)
     - Distribution methods (`03_distribution.md`)
     - Target audience (`04_audience.md`)
     - Business model (`05_business_model.md`)

2. **Choose Platform Template**:
   Based on your questionnaire answers, select the appropriate template from:
   - Commercial Platform (`setup/templates/commercial.md`)
   - Community Platform (`setup/templates/community.md`)
   - Educational Platform (`setup/templates/educational.md`)
   - Open Source Platform (`setup/templates/open_source.md`)

3. **Configure Platform**:
   - Run `setup/scripts/configure.sh` to apply your chosen template
   - The script will customize the context network based on your questionnaire responses
   - Review and adjust the generated structure as needed

4. **Begin Documentation**:
   - Update `foundation/project_definition.md` with your platform specifics
   - Document your technical architecture in `foundation/structure.md`
   - Begin tracking decisions in `decisions/`

## Structure

The context network is organized into specialized sections:

```
context-network/
├── discovery.md                    # Navigation guide for the network
├── foundation/                     # Core platform information
│   ├── project_definition.md       # Platform goals and scope
│   ├── structure.md               # Technical architecture
│   ├── principles.md              # Platform principles
│   └── content_strategy.md        # Content approach and standards
├── elements/                      # Platform components
│   ├── content_management/        # CMS architecture
│   ├── user_experience/           # UX patterns
│   ├── distribution/              # Distribution channels
│   └── monetization/              # Revenue models
├── processes/                     # Process documentation
│   ├── content_workflow.md        # Content lifecycle
│   ├── moderation.md             # Content moderation
│   ├── distribution.md           # Publishing process
│   └── analytics.md              # Performance tracking
├── decisions/                     # Key decisions
│   ├── decision_index.md         # Decision log
│   └── templates/                # Decision templates
├── connections/                   # Integration points
│   ├── dependencies.md           # System dependencies
│   └── interfaces.md             # API specifications
├── planning/                      # Development planning
│   ├── roadmap.md               # Feature roadmap
│   └── milestones.md            # Release planning
└── meta/                         # Network maintenance
    ├── updates.md               # Change log
    └── maintenance.md           # Maintenance procedures
```

## Best Practices

### Classification System

Use this classification system for media platform components:

1. **Domain**: Primary function area
   - Content Management
   - User Experience
   - Distribution
   - Analytics
   - Monetization

2. **Component Type**: Technical classification
   - Frontend
   - Backend
   - Infrastructure
   - Integration
   - Business Logic

3. **User Impact**: Effect on platform users
   - Direct (user-facing)
   - Indirect (system-level)
   - Hybrid

4. **Development Stage**: Implementation status
   - Planned
   - In Development
   - Live
   - Deprecated

### Relationship Types

Use these specialized relationship types for media platforms:

1. **Content Relationships**:
   - `produces`: Content creation flow
   - `consumes`: Content consumption pattern
   - `transforms`: Content modification
   - `distributes`: Distribution channel

2. **System Relationships**:
   - `depends-on`: System dependency
   - `integrates-with`: External integration
   - `extends`: Feature extension
   - `impacts`: Performance impact

3. **User Relationships**:
   - `interacts-with`: User touchpoint
   - `subscribes-to`: Subscription model
   - `moderates`: Content control
   - `analyzes`: Analytics tracking

### Documentation Guidelines

1. **Content Strategy**:
   - Document content types and formats
   - Define metadata requirements
   - Specify validation rules
   - Outline workflow states

2. **Technical Architecture**:
   - Use diagrams for system components
   - Document API specifications
   - Define data models
   - Specify performance requirements

3. **User Experience**:
   - Include user journey maps
   - Document interaction patterns
   - Define accessibility requirements
   - Specify responsive behaviors

4. **Business Rules**:
   - Document pricing models
   - Specify access controls
   - Define monetization strategies
   - Outline compliance requirements

## Tools

Context networks are designed to work with LLM agents that have file access. Recommended tools:

- **Cursor** (https://www.cursor.com/): IDE with integrated LLM capabilities
- **VSCode** with **Cline** (https://cline.bot/): Code editor with agent support
- **OpenRouter** (https://openrouter.ai/): Access to various LLM models

## Additional Resources

- Context Networks Guide: https://jwynia.github.io/context-networks/
- Custom Instructions: See `/inbox/custom-instructions-prompt.md`
- Setup Guide: See `/setup/README.md`
