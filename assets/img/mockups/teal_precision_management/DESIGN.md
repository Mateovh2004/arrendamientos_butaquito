---
name: Teal Precision Management
colors:
  surface: '#f8f9fa'
  surface-dim: '#d8dadb'
  surface-bright: '#f8f9fa'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f5'
  surface-container: '#edeeef'
  surface-container-high: '#e7e8e9'
  surface-container-highest: '#e1e3e4'
  on-surface: '#191c1d'
  on-surface-variant: '#40484b'
  inverse-surface: '#2e3132'
  inverse-on-surface: '#eff1f2'
  outline: '#70787c'
  outline-variant: '#c0c8cb'
  surface-tint: '#306576'
  primary: '#003441'
  on-primary: '#ffffff'
  primary-container: '#0f4c5c'
  on-primary-container: '#87bbce'
  inverse-primary: '#9acee1'
  secondary: '#306576'
  on-secondary: '#ffffff'
  secondary-container: '#b6ebff'
  on-secondary-container: '#376b7c'
  tertiary: '#263234'
  on-tertiary: '#ffffff'
  tertiary-container: '#3c484b'
  on-tertiary-container: '#a9b6b9'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#b6ebfe'
  primary-fixed-dim: '#9acee1'
  on-primary-fixed: '#001f28'
  on-primary-fixed-variant: '#114d5d'
  secondary-fixed: '#b6ebff'
  secondary-fixed-dim: '#9acee2'
  on-secondary-fixed: '#001f28'
  on-secondary-fixed-variant: '#124d5d'
  tertiary-fixed: '#d8e5e8'
  tertiary-fixed-dim: '#bcc9cc'
  on-tertiary-fixed: '#121d20'
  on-tertiary-fixed-variant: '#3d494b'
  background: '#f8f9fa'
  on-background: '#191c1d'
  surface-variant: '#e1e3e4'
  success: '#2d6a4f'
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
    letterSpacing: 0.08em
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
  unit: 8px
  gutter: 16px
  margin-sm: 16px
  margin-lg: 32px
  stack-xs: 4px
  stack-md: 12px
  stack-xl: 32px
---

## Brand & Style

The design system is engineered for a professional real estate tool that prioritizes **authority, precision, and institutional trust**. The brand personality is meticulously professional, aiming to provide property managers and agents with a sense of unwavering reliability.

The visual style follows **Modern Corporate Minimalism** with a focus on high-density information display. It utilizes a disciplined grid, generous whitespace to manage cognitive load, and a monochromatic color strategy to minimize distractions. The aesthetic is clean and structured, reflecting the organized nature of high-end property management and legal documentation.

## Colors

The palette is an exercise in tonal sophistication, anchored by **Deep Teal (#0f4c5c)**. This primary color represents the "trust anchor" of the application, used for essential navigation and primary interactive states. By removing energetic accents like orange, the system gains a more serious, executive-level feel.

- **Primary & Interactive:** Deep Teal is used for main actions. Hover and active states are derived by shifting the luminance of this base teal.
- **Support Tones:** Secondary and Tertiary teals create a layered hierarchy for containers and secondary actions without breaking the monochromatic harmony.
- **Surface Strategy:** An off-white neutral background reduces eye strain during long-form data entry, while varying shades of cool grey define content containers.
- **Functional Colors:** High-contrast greens and reds are reserved strictly for status-critical data (e.g., "Lease Active" vs. "Payment Overdue").

## Typography

This system uses **Inter** for its neutral, highly legible character, which is essential for mobile data entry and complex table views. To reinforce the "tool" and "data-driven" nature of the application, **JetBrains Mono** is utilized for labels, IDs, and financial figures.

Hierarchy is strictly enforced through weight. Headlines use a bold weight with negative letter-spacing to appear compact and authoritative. For body text, the 16px standard ensures accessibility across all device types, particularly for agents in the field.

## Layout & Spacing

The layout is based on a **Fluid Grid** with an 8px base unit. 

- **Mobile:** A 4-column layout with 16px side margins. 
- **Desktop:** A 12-column layout that prioritizes side-by-side data views (e.g., property details next to tenant history).

The spacing rhythm uses "Stacks" for vertical separation. `stack-md` is the standard gap between related form fields, while `stack-xl` separates major logical sections.

## Elevation & Depth

Visual hierarchy is established through **Tonal Layers** and **Low-Contrast Outlines** rather than aggressive shadows. 

- **Surface Levels:** The background is the lowest level. Content sits on pure white containers with a subtle 1px border (#edeeef).
- **Depth:** When elevation is required (e.g., for modals or floating menus), use a very soft, high-diffusion shadow tinted with the Primary Teal (e.g., `rgba(15, 76, 92, 0.08)`).
- **Interactive Layers:** Buttons and active cards use a subtle 1px inset or border change to indicate "pressability" rather than a physical lift.

## Shapes

The shape language is **Rounded**, using a 0.5rem (8px) base to balance professional structure with modern approachability.

- **Interactive Elements:** Buttons and input fields use the base 8px radius.
- **Containers:** Large cards and modals use 1rem (16px) to define distinct content areas.
- **Indicators:** Small badges and status chips use 4px (rounded-sm) to maintain a crisp, sharp appearance even at small scales.

## Components

### Buttons
- **Primary:** Solid Deep Teal (#0f4c5c) with white text. This is the main call to action for committing data or starting workflows.
- **Secondary:** Tonal Teal (#e1eef1) background with Deep Teal text. Used for secondary actions within a page.
- **Ghost:** No background, Deep Teal text. Reserved for navigation or "Cancel" actions.

### Input Fields
- **Default State:** 1px border (#70787c), white background.
- **Focus State:** 2px solid Deep Teal border. No outer glow, maintaining a "flat" professional look.
- **Labels:** Always use `label-caps` in JetBrains Mono above the input field to provide a systematic, data-heavy feel.

### Cards & Lists
- **Property Cards:** Use a 1px border instead of heavy shadows. Status indicators should be placed in the top-right as a tonal chip.
- **Data Rows:** Use subtle dividers (#edeeef) with a 56px minimum height to ensure easy touch interaction on mobile devices.

### Specialized UI
- **Metric Tiles:** Use JetBrains Mono for large numeric displays to emphasize the financial and technical nature of the property data.
- **Segmented Toggles:** Used for property conditions (e.g., "Excellent", "Standard", "Poor"). Use the Primary Teal for the selected state.