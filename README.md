# MathLearn - Understand Mathematics

A website to teach and explain each concept and chapter of mathematics from various textbooks. Hosted on GitHub Pages.

## Mission

Your goal is democratized clarity: anyone can follow the thread from "I've never seen this" to "I can use this," without needing a special background. The site proves that by how it teaches—patient structure, plain language, and no gatekeeping—not by dumbing things down.

## Four Pillars

### Clear
- One main idea per screen or section
- Short paragraphs
- Headings that say what the section does
- Define terms when they first matter
- Repeat the same idea in words, then with a small example
- Optional "In one sentence" or "Why this matters" boxes for skimming

### Organized
- Stable hierarchy: Textbook → Unit/Part → Chapter → Lesson (concept)
- Same pattern everywhere so muscle memory builds
- Every lesson page: goal → idea → example → check-yourself → what's next
- Breadcrumbs so people always know where they are

### Animated
- Use motion to explain, not decorate
- Highlight what changed in a step
- Reveal the next line of a derivation
- Show graphs building up
- Respect reduced motion (prefers-reduced-motion)
- Keep animations short so they don't compete with the math
- Prefer CSS transitions and small, purposeful motion
- Add JS only where interaction really helps

### Functional
- Fast load
- Readable type
- Good contrast
- Keyboard-friendly navigation
- Later: search, "next/previous lesson," maybe simple practice

## Site Structure

```
/
├── index.html                 # Landing page
├── styles.css                 # Main stylesheet
├── script.js                  # JavaScript for animations
├── textbooks/
│   ├── calculus-vol1/
│   │   ├── index.html         # Textbook overview
│   │   ├── ch1/               # Chapter 1
│   │   │   ├── lesson1.html   # Lesson pages
│   │   │   ├── lesson2.html
│   │   │   └── ...
│   │   ├── ch2/               # Chapter 2
│   │   └── ...
│   ├── calculus-vol2/
│   ├── calculus-vol3/
│   ├── differential-equations/
│   └── real-analysis/
└── README.md
```

## Textbooks Included

1. **Calculus Volume 1** - Limits, derivatives, and integrals
2. **Calculus Volume 2** - Integration techniques, sequences, series
3. **Calculus Volume 3** - Multivariable calculus, vector calculus
4. **Differential Equations** - Solving equations involving derivatives
5. **Real Analysis** - Rigorous foundations of calculus

## How to Use

1. Choose a textbook from the landing page
2. Browse chapters - each has a summary, required skills, and difficulty rating
3. Click on a lesson to start learning
4. Each lesson follows: Goal → Idea → Example → Check Yourself → What's Next
5. Use the step-by-step guides to understand how to solve problems

## Deployment

This site is designed to be hosted on GitHub Pages:

1. Push this repository to GitHub
2. Go to Settings → Pages
3. Select the main branch as the source
4. The site will be available at `https://[username].github.io/[repository-name]/`

## Features

- **Responsive Design** - Works on desktop, tablet, and mobile
- **Accessibility** - Keyboard navigation, reduced motion support, good contrast
- **Fast Loading** - Minimal dependencies, optimized CSS
- **Print Friendly** - Print button on lesson pages
- **Reading Progress** - Progress bar shows how far you've read
- **Table of Contents** - Auto-generated for lesson pages
- **Breadcrumbs** - Always know where you are in the site

## Adding New Content

To add a new lesson:

1. Create an HTML file in the appropriate chapter folder
2. Use the lesson template structure:
   - Goal section
   - Idea section with explanations
   - Examples with step-by-step solutions
   - Step-by-step guide for solving problems
   - Check yourself questions
   - What's next link
3. Update the chapter index to include the new lesson

## License

© 2024 MathLearn. Making mathematics accessible to everyone.
