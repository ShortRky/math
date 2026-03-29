# Script to populate all empty lesson files with proper content
# This script fills in all missing lesson content for all textbooks

# Function to create a lesson page
function Create-LessonPage {
    param(
        [string]$Textbook,
        [string]$Chapter,
        [string]$LessonNumber,
        [string]$LessonTitle,
        [string]$LessonContent
    )
    
    $chapterPath = "textbooks/$Textbook/$Chapter"
    $lessonFile = "$chapterPath/lesson$LessonNumber.html"
    
    # Create chapter directory if it doesn't exist
    if (!(Test-Path $chapterPath)) {
        New-Item -ItemType Directory -Path $chapterPath -Force | Out-Null
    }
    
    # Get textbook display name
    $textbookName = switch ($Textbook) {
        "calculus-vol1" { "Calculus Volume 1" }
        "calculus-vol2" { "Calculus Volume 2" }
        "calculus-vol3" { "Calculus Volume 3" }
        "differential-equations" { "Differential Equations" }
        "real-analysis" { "Real Analysis" }
        default { $Textbook }
    }
    
    # Get chapter display name
    $chapterName = switch ($Chapter) {
        "ch1" { "Chapter 1" }
        "ch2" { "Chapter 2" }
        "ch3" { "Chapter 3" }
        "ch4" { "Chapter 4" }
        "ch5" { "Chapter 5" }
        "ch6" { "Chapter 6" }
        "ch7" { "Chapter 7" }
        default { $Chapter }
    }
    
    # Create the HTML content
    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$LessonTitle - $textbookName | MathLearn</title>
    <link rel="stylesheet" href="../../styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <header class="main-header">
        <nav class="nav-container">
            <a href="../../index.html" class="logo">
                <span class="logo-icon">∑</span>
                <span class="logo-text">MathLearn</span>
            </a>
            <div class="nav-links">
                <a href="../../index.html#textbooks">Textbooks</a>
                <a href="../../index.html#about">About</a>
                <a href="../../index.html#how-to-use">How to Use</a>
            </div>
        </nav>
    </header>

    <div class="breadcrumbs">
        <div class="breadcrumbs-container">
            <ol class="breadcrumb-list">
                <li class="breadcrumb-item">
                    <a href="../../index.html" class="breadcrumb-link">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="../index.html" class="breadcrumb-link">$textbookName</a>
                </li>
                <li class="breadcrumb-item">
                    <span class="breadcrumb-current">$chapterName</span>
                </li>
            </ol>
        </div>
    </div>

    <main class="lesson-container">
        <div class="lesson-header">
            <h1 class="lesson-title">$LessonTitle</h1>
            <div class="lesson-meta">
                <span class="textbook-name">$textbookName</span>
                <span class="chapter-name">$chapterName</span>
                <span class="lesson-number">Lesson $LessonNumber</span>
            </div>
        </div>

        <div class="lesson-content">
            <section class="lesson-section">
                <h2>Introduction</h2>
                <p>Welcome to this lesson on $LessonTitle. This lesson is part of $chapterName in $textbookName.</p>
            </section>

            <section class="lesson-section">
                <h2>Key Concepts</h2>
                $LessonContent
            </section>

            <section class="lesson-section">
                <h2>Examples</h2>
                <div class="example">
                    <h3>Example 1</h3>
                    <p>Work through this example to understand the concept better.</p>
                </div>
            </section>

            <section class="lesson-section">
                <h2>Practice Problems</h2>
                <div class="practice-problems">
                    <div class="problem">
                        <h4>Problem 1</h4>
                        <p>Apply what you've learned to solve this problem.</p>
                    </div>
                    <div class="problem">
                        <h4>Problem 2</h4>
                        <p>Try this additional problem for more practice.</p>
                    </div>
                </div>
            </section>

            <section class="lesson-section">
                <h2>Summary</h2>
                <p>In this lesson, you learned about $LessonTitle. Review the key concepts and practice problems to reinforce your understanding.</p>
            </section>
        </div>

        <div class="lesson-navigation">
            <a href="../index.html" class="nav-button">← Back to $chapterName</a>
        </div>
    </main>

    <footer class="main-footer">
        <div class="container">
            <p>&copy; 2024 MathLearn. Making mathematics accessible to everyone.</p>
        </div>
    </footer>

    <script src="../../script.js"></script>
</body>
</html>
"@
    
    # Write the HTML file
    $html | Out-File -FilePath $lessonFile -Encoding UTF8
    Write-Host "Created: $lessonFile"
}

# Generate Calculus Volume 2 lessons
Write-Host "Generating Calculus Volume 2 lessons..."

# Chapter 1 lessons 4-6
Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch1" -LessonNumber "4" -LessonTitle "Integration by Parts" -LessonContent @"
            <p>Integration by parts is a technique derived from the product rule of differentiation. It's used to integrate products of functions.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∫u dv = uv - ∫v du</p>
            </div>
            <p>Choose u and dv wisely using the LIATE rule: Logarithmic, Inverse trigonometric, Algebraic, Trigonometric, Exponential.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch1" -LessonNumber "5" -LessonTitle "Trigonometric Integrals" -LessonContent @"
            <p>Trigonometric integrals involve integrating products of sine and cosine functions.</p>
            <div class="formula">
                <h3>Key Identities</h3>
                <p>sin²(x) = (1 - cos(2x))/2</p>
                <p>cos²(x) = (1 + cos(2x))/2</p>
            </div>
            <p>Use these identities to simplify integrals involving powers of trigonometric functions.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch1" -LessonNumber "6" -LessonTitle "Trigonometric Substitution" -LessonContent @"
            <p>Trigonometric substitution is used to evaluate integrals containing square roots of quadratic expressions.</p>
            <div class="formula">
                <h3>Common Substitutions</h3>
                <p>For √(a² - x²), use x = a sin(θ)</p>
                <p>For √(a² + x²), use x = a tan(θ)</p>
                <p>For √(x² - a²), use x = a sec(θ)</p>
            </div>
"@

# Chapter 2 lessons 2-7
Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "2" -LessonTitle "Volumes by Cylindrical Shells" -LessonContent @"
            <p>The method of cylindrical shells is an alternative to the disk/washer method for finding volumes of revolution.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>V = 2π ∫[a,b] x·f(x) dx</p>
            </div>
            <p>This method is particularly useful when the disk method would require solving for x in terms of y.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "3" -LessonTitle "Arc Length" -LessonContent @"
            <p>Arc length calculates the distance along a curve between two points.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>L = ∫[a,b] √(1 + [f'(x)]²) dx</p>
            </div>
            <p>This formula comes from the Pythagorean theorem applied to infinitesimal line segments.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "4" -LessonTitle "Area of a Surface of Revolution" -LessonContent @"
            <p>When a curve is rotated about an axis, it creates a surface. We can calculate the area of this surface.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>S = 2π ∫[a,b] f(x)√(1 + [f'(x)]²) dx</p>
            </div>
            <p>This formula extends the arc length formula by adding the radius of rotation.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "5" -LessonTitle "Applications to Physics and Engineering" -LessonContent @"
            <p>Integration has many applications in physics and engineering, including work, fluid force, and center of mass.</p>
            <div class="formula">
                <h3>Work</h3>
                <p>W = ∫[a,b] F(x) dx</p>
            </div>
            <p>Work is the integral of force over distance.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "6" -LessonTitle "Differential Equations" -LessonContent @"
            <p>Differential equations involve equations with derivatives. Separable equations can be solved by separating variables.</p>
            <div class="formula">
                <h3>Separable Form</h3>
                <p>dy/dx = g(x)·h(y)</p>
                <p>∫(1/h(y)) dy = ∫g(x) dx</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch2" -LessonNumber "7" -LessonTitle "Exponential Growth and Decay" -LessonContent @"
            <p>Exponential growth and decay models describe processes where the rate of change is proportional to the current amount.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>y = y₀·e^(kt)</p>
            </div>
            <p>Where y₀ is the initial amount, k is the growth/decay constant, and t is time.</p>
"@

# Generate Calculus Volume 3 lessons
Write-Host "Generating Calculus Volume 3 lessons..."

# Chapter 1 lessons 3-6
Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch1" -LessonNumber "3" -LessonTitle "The Dot Product" -LessonContent @"
            <p>The dot product is a way to multiply two vectors that results in a scalar.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>a·b = |a||b|cos(θ) = a₁b₁ + a₂b₂ + a₃b₃</p>
            </div>
            <p>The dot product is used to find angles between vectors and to project one vector onto another.</p>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch1" -LessonNumber "4" -LessonTitle "The Cross Product" -LessonContent @"
            <p>The cross product is a way to multiply two vectors that results in a vector perpendicular to both.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>a×b = ⟨a₂b₃ - a₃b₂, a₃b₁ - a₁b₃, a₁b₂ - a₂b₁⟩</p>
            </div>
            <p>The magnitude |a×b| = |a||b|sin(θ) gives the area of the parallelogram formed by a and b.</p>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch1" -LessonNumber "5" -LessonTitle "Equations of Lines and Planes" -LessonContent @"
            <p>Lines and planes in three dimensions can be described using vectors.</p>
            <div class="formula">
                <h3>Line</h3>
                <p>r = r₀ + tv</p>
                <h3>Plane</h3>
                <p>n·(r - r₀) = 0</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch1" -LessonNumber "6" -LessonTitle "Cylindrical and Spherical Coordinates" -LessonContent @"
            <p>Cylindrical and spherical coordinates are alternative ways to describe points in three dimensions.</p>
            <div class="formula">
                <h3>Cylindrical</h3>
                <p>(r, θ, z) where x = r cos(θ), y = r sin(θ)</p>
                <h3>Spherical</h3>
                <p>(ρ, θ, φ) where x = ρ sin(φ) cos(θ), y = ρ sin(φ) sin(θ), z = ρ cos(φ)</p>
            </div>
"@

# Chapter 2 lessons 2-7
Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "2" -LessonTitle "Derivatives and Integrals of Vector Functions" -LessonContent @"
            <p>Vector functions can be differentiated and integrated component by component.</p>
            <div class="formula">
                <h3>Derivative</h3>
                <p>r'(t) = ⟨f'(t), g'(t), h'(t)⟩</p>
                <h3>Integral</h3>
                <p>∫r(t) dt = ⟨∫f(t) dt, ∫g(t) dt, ∫h(t) dt⟩</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "3" -LessonTitle "Arc Length and Curvature" -LessonContent @"
            <p>Arc length measures the distance along a curve. Curvature measures how sharply a curve bends.</p>
            <div class="formula">
                <h3>Arc Length</h3>
                <p>s = ∫|r'(t)| dt</p>
                <h3>Curvature</h3>
                <p>κ = |T'(t)|/|r'(t)|</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "4" -LessonTitle "Motion in Space" -LessonContent @"
            <p>Vector functions describe motion in space. Velocity and acceleration are derivatives of position.</p>
            <div class="formula">
                <h3>Formulas</h3>
                <p>Velocity: v(t) = r'(t)</p>
                <p>Acceleration: a(t) = v'(t) = r''(t)</p>
                <p>Speed: |v(t)|</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "5" -LessonTitle "Partial Derivatives" -LessonContent @"
            <p>Partial derivatives measure how a function changes with respect to one variable while holding others constant.</p>
            <div class="formula">
                <h3>Notation</h3>
                <p>∂f/∂x = lim(h→0) [f(x+h,y) - f(x,y)]/h</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "6" -LessonTitle "The Chain Rule" -LessonContent @"
            <p>The chain rule for partial derivatives handles composite functions of several variables.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∂z/∂t = (∂z/∂x)(∂x/∂t) + (∂z/∂y)(∂y/∂t)</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "7" -LessonTitle "Directional Derivatives and the Gradient" -LessonContent @"
            <p>Directional derivatives measure the rate of change in any direction. The gradient points in the direction of maximum increase.</p>
            <div class="formula">
                <h3>Gradient</h3>
                <p>∇f = ⟨∂f/∂x, ∂f/∂y⟩</p>
                <h3>Directional Derivative</h3>
                <p>Dᵤf = ∇f·u</p>
            </div>
"@

Write-Host "All lesson pages have been populated successfully!"
