---
name: Arrendamientos Butaquito
colors:
  surface: '#f8f9fa'
  surface-dim: '#d9dadb'
  surface-bright: '#f8f9fa'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f3f4f5'
  surface-container: '#edeeef'
  surface-container-high: '#e7e8e9'
  surface-container-highest: '#e1e3e4'
  on-surface: '#191c1d'
  on-surface-variant: '#40484b'
  inverse-surface: '#2e3132'
  inverse-on-surface: '#f0f1f2'
  outline: '#70787c'
  outline-variant: '#c0c8cb'
  surface-tint: '#306576'
  primary: '#003441'
  on-primary: '#ffffff'
  primary-container: '#0f4c5c'
  on-primary-container: '#87bbce'
  inverse-primary: '#9acee1'
  secondary: '#a04100'
  on-secondary: '#ffffff'
  secondary-container: '#fd7729'
  on-secondary-container: '#5e2300'
  tertiary: '#2d3221'
  on-tertiary: '#ffffff'
  tertiary-container: '#434836'
  on-tertiary-container: '#b2b69f'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#b6ebfe'
  primary-fixed-dim: '#9acee1'
  on-primary-fixed: '#001f28'
  on-primary-fixed-variant: '#114d5d'
  secondary-fixed: '#ffdbcc'
  secondary-fixed-dim: '#ffb693'
  on-secondary-fixed: '#351000'
  on-secondary-fixed-variant: '#7a3000'
  tertiary-fixed: '#e0e5cc'
  tertiary-fixed-dim: '#c4c9b1'
  on-tertiary-fixed: '#191d0e'
  on-tertiary-fixed-variant: '#444937'
  background: '#f8f9fa'
  on-background: '#191c1d'
  surface-variant: '#e1e3e4'
typography:
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-caps:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.05em
  button-text:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 32px
  stack-sm: 4px
  stack-md: 12px
  stack-lg: 24px
---

## Brand & Style

The design system is built for "Arrendamientos Butaquito," a property inventory management application that bridges the gap between traditional real estate values and modern digital efficiency. The brand personality is **reliable, meticulous, and approachable**. It aims to evoke a sense of professional security for property owners while providing a frictionless, high-speed utility for field agents.

The visual style is **Modern Corporate Minimalism**. It prioritizes high legibility and functional clarity above all else. By using a disciplined grid and purposeful whitespace, the interface minimizes cognitive load during complex inventory tasks. Subtle elevation and soft architectural cues reflect the physical nature of the property business, creating a digital environment that feels as sturdy and well-constructed as the buildings it manages.

## Colors

The color palette is anchored by **Deep Professional Teal**, signaling stability and institutional trust. This is the primary driver for navigation, headers, and core actions. 

The **Butaquito Orange** serves as the energetic accent, reserved specifically for primary calls to action (e.g., "Start Inventory," "Sign Document") and critical status indicators. This warm tone provides a high-contrast focal point against the cooler primary colors.

A secondary **Moss Grey/Wooden Brown** is utilized for metadata and secondary iconography, grounding the palette in organic, property-related tones. The background uses a slightly off-white neutral to reduce screen glare for agents working in brightly lit properties or outdoor environments.

## Typography

The typography system utilizes **Inter** for its exceptional legibility on mobile displays and its neutral, professional character. To emphasize the "management" and "data" aspect of the app, **JetBrains Mono** is introduced for labels and property IDs, providing a precise, systematic feel to technical details.

Hierarchy is established through weight shifts rather than excessive size changes. For mobile field use, the `body-lg` size (16px) is the standard for all input text to ensure ease of reading under varied lighting conditions. All headlines use tighter letter-spacing to maintain a compact, modern appearance.

## Layout & Spacing

This design system employs a **Fluid Grid** model based on an 8px square rhythm. For mobile devices, a 4-column layout is used with 16px margins. On desktop and tablet, the system expands to a 12-column layout to allow for side-by-side property comparisons and data entry.

Spacing is categorized into "Stacks" (vertical) and "Insets" (horizontal). Elements within a property card use `stack-sm`, while logical sections on a page use `stack-lg`. This consistent vertical rhythm ensures the long forms typical of inventory management remain scannable and organized.

## Elevation & Depth

Visual hierarchy is conveyed through **Tonal Layers** and **Soft Ambient Shadows**. 

1.  **Level 0 (Base):** The neutral background (#F8F9FA).
2.  **Level 1 (Cards/Containers):** Pure white surfaces with a 1px border (#E9ECEF) and a very soft, diffused shadow (0px 4px 12px rgba(15, 76, 92, 0.05)).
3.  **Level 2 (Modals/Overlays):** White surfaces with a more pronounced shadow (0px 8px 24px rgba(0, 0, 0, 0.12)) to indicate temporary interaction.

Avoid heavy black shadows; instead, use shadows tinted with the Primary Teal color to maintain a cohesive, "clean" aesthetic.

## Shapes

The shape language is defined as **Rounded**, utilizing a standard 8px (0.5rem) corner radius for most UI components. This choice softens the "technical" feel of the app, making it feel more accessible and user-friendly.

-   **Small Elements (Chips, Checkboxes):** 4px (rounded-sm).
-   **Standard Elements (Buttons, Inputs, Cards):** 8px (base roundedness).
-   **Large Elements (Feature Banners, Modals):** 16px (rounded-lg).

This consistent radii creates a sense of harmony across different component scales.

## Components

### Buttons
- **Primary:** Solid Butaquito Orange (#E36414) with white text. 8px radius. High emphasis.
- **Secondary:** Outlined Primary Teal (#0F4C5C) with 1px stroke. Used for "Add Photo" or "Save Draft."
- **Tertiary/Ghost:** No background, Primary Teal text. Used for "Cancel" or "Go Back."

### Input Fields
- **Default State:** White background, 1px light grey border, 8px radius.
- **Focus State:** 2px Primary Teal border with a soft teal outer glow.
- **Labels:** Use `label-caps` in JetBrains Mono, positioned above the field for maximum visibility during data entry.

### Property Cards
- Cards must feature a high-quality thumbnail with 8px radius.
- Key property status (e.g., "Occupied", "Under Review") should be displayed as a Chip in the top right corner.

### Chips
- Used for status and categories. Use light tinted backgrounds (e.g., Light Teal for "Clean", Light Orange for "Requires Maintenance") with darker text of the same hue.

### Lists
- Inventory lists use "divided" rows with 1px horizontal separators. Each row should have a minimum height of 56px to provide a large tap target for field agents.

### Specialized Components
- **Camera Trigger:** A large, prominent floating action button (FAB) in Primary Teal used when the agent is inside a specific room to quickly document findings.
- **Condition Toggles:** A three-state segmented control (Good | Fair | Poor) for rapid assessment.