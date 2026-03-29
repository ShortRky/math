# Script to generate all missing lesson pages
# This script creates lesson pages for all missing chapters and lessons

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

# Chapter 3 lessons 2-4
Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch3" -LessonNumber "2" -LessonTitle "Sequences" -LessonContent @"
            <p>A sequence is an ordered list of numbers. Sequences can converge or diverge.</p>
            <div class="formula">
                <h3>Convergence</h3>
                <p>A sequence {aₙ} converges to L if lim(n→∞) aₙ = L</p>
            </div>
            <p>If the limit exists and is finite, the sequence converges. Otherwise, it diverges.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch3" -LessonNumber "3" -LessonTitle "Series" -LessonContent @"
            <p>A series is the sum of the terms of a sequence. Series can converge or diverge.</p>
            <div class="formula">
                <h3>Geometric Series</h3>
                <p>∑(n=0 to ∞) arⁿ = a/(1-r) if |r| < 1</p>
            </div>
            <p>The geometric series converges when the common ratio r has absolute value less than 1.</p>
"@

Create-LessonPage -Textbook "calculus-vol2" -Chapter "ch3" -LessonNumber "4" -LessonTitle "The Integral Test and Comparison Tests" -LessonContent @"
            <p>The integral test and comparison tests help determine whether series converge or diverge.</p>
            <div class="formula">
                <h3>Integral Test</h3>
                <p>If f is positive, continuous, and decreasing, then ∑f(n) and ∫f(x)dx both converge or both diverge.</p>
            </div>
"@

# Generate Calculus Volume 3 lessons
Write-Host "Generating Calculus Volume 3 lessons..."

# Chapter 1 lessons 2-6
Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch1" -LessonNumber "2" -LessonTitle "Vectors in Three Dimensions" -LessonContent @"
            <p>Vectors in three dimensions have three components: i, j, and k.</p>
            <div class="formula">
                <h3>Vector Notation</h3>
                <p>v = ⟨x, y, z⟩ = xi + yj + zk</p>
            </div>
            <p>The magnitude is |v| = √(x² + y² + z²)</p>
"@

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

# Chapter 2 lessons 1-7
Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch2" -LessonNumber "1" -LessonTitle "Vector Functions" -LessonContent @"
            <p>Vector functions map real numbers to vectors. They describe curves in space.</p>
            <div class="formula">
                <h3>Notation</h3>
                <p>r(t) = ⟨f(t), g(t), h(t)⟩</p>
            </div>
            <p>The derivative r'(t) gives the tangent vector to the curve.</p>
"@

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

# Chapter 3 lessons 1-6
Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "1" -LessonTitle "Double Integrals over Rectangles" -LessonContent @"
            <p>Double integrals extend integration to functions of two variables over rectangular regions.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∫∫R f(x,y) dA = ∫[a,b] ∫[c,d] f(x,y) dy dx</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "2" -LessonTitle "Double Integrals over General Regions" -LessonContent @"
            <p>Double integrals can be evaluated over non-rectangular regions.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∫∫D f(x,y) dA = ∫[a,b] ∫[g₁(x),g₂(x)] f(x,y) dy dx</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "3" -LessonTitle "Double Integrals in Polar Coordinates" -LessonContent @"
            <p>Polar coordinates simplify double integrals over circular regions.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∫∫R f(x,y) dA = ∫∫R f(r cos θ, r sin θ) r dr dθ</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "4" -LessonTitle "Applications of Double Integrals" -LessonContent @"
            <p>Double integrals can be used to find area, volume, mass, and center of mass.</p>
            <div class="formula">
                <h3>Area</h3>
                <p>A = ∫∫D dA</p>
                <h3>Volume</h3>
                <p>V = ∫∫D f(x,y) dA</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "5" -LessonTitle "Triple Integrals" -LessonContent @"
            <p>Triple integrals extend integration to functions of three variables.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>∫∫∫E f(x,y,z) dV = ∫∫∫E f(x,y,z) dz dy dx</p>
            </div>
"@

Create-LessonPage -Textbook "calculus-vol3" -Chapter "ch3" -LessonNumber "6" -LessonTitle "Triple Integrals in Cylindrical and Spherical Coordinates" -LessonContent @"
            <p>Cylindrical and spherical coordinates simplify triple integrals over symmetric regions.</p>
            <div class="formula">
                <h3>Cylindrical</h3>
                <p>dV = r dz dr dθ</p>
                <h3>Spherical</h3>
                <p>dV = ρ² sin(φ) dρ dφ dθ</p>
            </div>
"@

# Generate Differential Equations lessons
Write-Host "Generating Differential Equations lessons..."

# Chapter 1 lessons 2-6
Create-LessonPage -Textbook "differential-equations" -Chapter "ch1" -LessonNumber "2" -LessonTitle "Direction Fields" -LessonContent @"
            <p>Direction fields visualize the behavior of differential equations without solving them.</p>
            <p>At each point (x,y), draw a small line segment with slope given by dy/dx.</p>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch1" -LessonNumber "3" -LessonTitle "Separable Equations" -LessonContent @"
            <p>Separable equations can be written with all y terms on one side and all x terms on the other.</p>
            <div class="formula">
                <h3>Form</h3>
                <p>dy/dx = g(x)·h(y)</p>
                <p>∫(1/h(y)) dy = ∫g(x) dx</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch1" -LessonNumber "4" -LessonTitle "Linear Equations" -LessonContent @"
            <p>First-order linear equations have the form dy/dx + P(x)y = Q(x).</p>
            <div class="formula">
                <h3>Integrating Factor</h3>
                <p>μ(x) = e^(∫P(x) dx)</p>
            </div>
            <p>Multiply both sides by μ(x) to make the left side a derivative of a product.</p>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch1" -LessonNumber "5" -LessonTitle "Exact Equations" -LessonContent @"
            <p>An equation M(x,y)dx + N(x,y)dy = 0 is exact if ∂M/∂y = ∂N/∂x.</p>
            <div class="formula">
                <h3>Solution</h3>
                <p>Find F such that ∂F/∂x = M and ∂F/∂y = N</p>
                <p>The solution is F(x,y) = C</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch1" -LessonNumber "6" -LessonTitle "Numerical Methods" -LessonContent @"
            <p>Numerical methods approximate solutions when analytical solutions are difficult or impossible.</p>
            <div class="formula">
                <h3>Euler's Method</h3>
                <p>yₙ₊₁ = yₙ + h·f(xₙ, yₙ)</p>
            </div>
            <p>Where h is the step size.</p>
"@

# Chapter 2 lessons 1-6
Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "1" -LessonTitle "Second-Order Linear Equations" -LessonContent @"
            <p>Second-order linear equations have the form y'' + P(x)y' + Q(x)y = R(x).</p>
            <p>The general solution is the sum of the complementary solution and a particular solution.</p>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "2" -LessonTitle "Homogeneous Equations with Constant Coefficients" -LessonContent @"
            <p>For ay'' + by' + cy = 0, solve the characteristic equation ar² + br + c = 0.</p>
            <div class="formula">
                <h3>Solutions</h3>
                <p>Two real roots r₁, r₂: y = C₁e^(r₁x) + C₂e^(r₂x)</p>
                <p>Repeated root r: y = (C₁ + C₂x)e^(rx)</p>
                <p>Complex roots α ± βi: y = e^(αx)(C₁ cos(βx) + C₂ sin(βx))</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "3" -LessonTitle "Non-Homogeneous Equations" -LessonContent @"
            <p>For non-homogeneous equations, find a particular solution using undetermined coefficients or variation of parameters.</p>
            <p>The general solution is y = yₚ + yₕ where yₚ is particular and yₕ is homogeneous.</p>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "4" -LessonTitle "Undetermined Coefficients" -LessonContent @"
            <p>For equations with constant coefficients and specific forms of R(x), guess the form of the particular solution.</p>
            <div class="formula">
                <h3>Common Guesses</h3>
                <p>R(x) = e^(ax): yₚ = Ae^(ax)</p>
                <p>R(x) = sin(ax) or cos(ax): yₚ = A sin(ax) + B cos(ax)</p>
                <p>R(x) = polynomial: yₚ = polynomial of same degree</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "5" -LessonTitle "Variation of Parameters" -LessonContent @"
            <p>Variation of parameters works for any non-homogeneous equation.</p>
            <div class="formula">
                <h3>Formula</h3>
                <p>yₚ = -y₁∫(y₂R/W) dx + y₂∫(y₁R/W) dx</p>
                <p>Where W = y₁y₂' - y₂y₁' is the Wronskian</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch2" -LessonNumber "6" -LessonTitle "Applications of Second-Order Equations" -LessonContent @"
            <p>Second-order equations model oscillations, circuits, and mechanical systems.</p>
            <div class="formula">
                <h3>Spring-Mass System</h3>
                <p>mx'' + cx' + kx = F(t)</p>
                <h3>RLC Circuit</h3>
                <p>LQ'' + RQ' + (1/C)Q = E(t)</p>
            </div>
"@

# Chapter 3 lessons 1-5
Create-LessonPage -Textbook "differential-equations" -Chapter "ch3" -LessonNumber "1" -LessonTitle "The Laplace Transform" -LessonContent @"
            <p>The Laplace transform converts differential equations into algebraic equations.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>L{f(t)} = F(s) = ∫[0,∞) e^(-st) f(t) dt</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch3" -LessonNumber "2" -LessonTitle "Inverse Laplace Transforms" -LessonContent @"
            <p>The inverse Laplace transform recovers the original function from its transform.</p>
            <div class="formula">
                <h3>Common Transforms</h3>
                <p>L{1} = 1/s</p>
                <p>L{e^(at)} = 1/(s-a)</p>
                <p>L{sin(at)} = a/(s² + a²)</p>
                <p>L{cos(at)} = s/(s² + a²)</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch3" -LessonNumber "3" -LessonTitle "Solving Initial Value Problems" -LessonContent @"
            <p>Use Laplace transforms to solve initial value problems by transforming, solving algebraically, and transforming back.</p>
            <div class="formula">
                <h3>Derivative Property</h3>
                <p>L{y'} = sY(s) - y(0)</p>
                <p>L{y''} = s²Y(s) - sy(0) - y'(0)</p>
            </div>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch3" -LessonNumber "4" -LessonTitle "Step Functions" -LessonContent @"
            <p>The Heaviside step function u(t-a) is 0 for t < a and 1 for t ≥ a.</p>
            <div class="formula">
                <h3>Laplace Transform</h3>
                <p>L{u(t-a)f(t-a)} = e^(-as)F(s)</p>
            </div>
            <p>This property allows us to handle piecewise-defined functions.</p>
"@

Create-LessonPage -Textbook "differential-equations" -Chapter "ch3" -LessonNumber "5" -LessonTitle "Convolution" -LessonContent @"
            <p>Convolution combines two functions and is related to the product of their Laplace transforms.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>(f * g)(t) = ∫[0,t] f(τ)g(t-τ) dτ</p>
                <h3>Property</h3>
                <p>L{f * g} = F(s)·G(s)</p>
            </div>
"@

# Generate Real Analysis lessons
Write-Host "Generating Real Analysis lessons..."

# Chapter 1 lessons 2-5
Create-LessonPage -Textbook "real-analysis" -Chapter "ch1" -LessonNumber "2" -LessonTitle "The Completeness Axiom" -LessonContent @"
            <p>The completeness axiom states that every non-empty set of real numbers that is bounded above has a least upper bound.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>A set S ⊂ ℝ is bounded above if ∃M such that x ≤ M for all x ∈ S.</p>
                <p>The supremum sup(S) is the least upper bound.</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch1" -LessonNumber "3" -LessonTitle "Mathematical Induction" -LessonContent @"
            <p>Mathematical induction proves statements about natural numbers.</p>
            <div class="formula">
                <h3>Principle</h3>
                <p>1. Base case: P(1) is true</p>
                <p>2. Inductive step: P(k) implies P(k+1)</p>
                <p>Then P(n) is true for all n ∈ ℕ</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch1" -LessonNumber "4" -LessonTitle "Countable and Uncountable Sets" -LessonContent @"
            <p>A set is countable if it can be put in one-to-one correspondence with ℕ.</p>
            <div class="formula">
                <h3>Examples</h3>
                <p>Countable: ℕ, ℤ, ℚ</p>
                <p>Uncountable: ℝ</p>
            </div>
            <p>Cantor's diagonal argument shows ℝ is uncountable.</p>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch1" -LessonNumber "5" -LessonTitle "Metric Spaces" -LessonContent @"
            <p>A metric space is a set with a distance function satisfying certain properties.</p>
            <div class="formula">
                <h3>Properties</h3>
                <p>1. d(x,y) ≥ 0</p>
                <p>2. d(x,y) = 0 iff x = y</p>
                <p>3. d(x,y) = d(y,x)</p>
                <p>4. d(x,z) ≤ d(x,y) + d(y,z)</p>
            </div>
"@

# Chapter 2 lessons 1-6
Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "1" -LessonTitle "Sequences and Convergence" -LessonContent @"
            <p>A sequence converges to L if for every ε > 0, there exists N such that |aₙ - L| < ε for all n > N.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>lim(n→∞) aₙ = L iff ∀ε > 0, ∃N such that n > N implies |aₙ - L| < ε</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "2" -LessonTitle "Limit Theorems" -LessonContent @"
            <p>Limits of sequences satisfy algebraic properties.</p>
            <div class="formula">
                <h3>Theorems</h3>
                <p>lim(aₙ + bₙ) = lim aₙ + lim bₙ</p>
                <p>lim(aₙ · bₙ) = lim aₙ · lim bₙ</p>
                <p>lim(aₙ / bₙ) = lim aₙ / lim bₙ (if lim bₙ ≠ 0)</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "3" -LessonTitle "Monotone Sequences" -LessonContent @"
            <p>A monotone sequence is either increasing or decreasing.</p>
            <div class="formula">
                <h3>Monotone Convergence Theorem</h3>
                <p>Every bounded monotone sequence converges.</p>
            </div>
            <p>An increasing sequence bounded above converges to its supremum.</p>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "4" -LessonTitle "Subsequences" -LessonContent @"
            <p>A subsequence is a sequence formed by selecting terms from another sequence.</p>
            <div class="formula">
                <h3>Bolzano-Weierstrass Theorem</h3>
                <p>Every bounded sequence has a convergent subsequence.</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "5" -LessonTitle "Cauchy Sequences" -LessonContent @"
            <p>A Cauchy sequence is one where terms get arbitrarily close to each other.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>{aₙ} is Cauchy iff ∀ε > 0, ∃N such that m,n > N implies |aₘ - aₙ| < ε</p>
                <h3>Completeness</h3>
                <p>A metric space is complete iff every Cauchy sequence converges.</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch2" -LessonNumber "6" -LessonTitle "Limits of Functions" -LessonContent @"
            <p>The limit of a function at a point generalizes the concept of sequence limits.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>lim(x→a) f(x) = L iff ∀ε > 0, ∃δ > 0 such that 0 < |x-a| < δ implies |f(x) - L| < ε</p>
            </div>
"@

# Chapter 3 lessons 1-5
Create-LessonPage -Textbook "real-analysis" -Chapter "ch3" -LessonNumber "1" -LessonTitle "Continuity" -LessonContent @"
            <p>A function is continuous at a point if the limit equals the function value.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>f is continuous at a iff lim(x→a) f(x) = f(a)</p>
            </div>
            <p>Equivalently, ∀ε > 0, ∃δ > 0 such that |x-a| < δ implies |f(x) - f(a)| < ε</p>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch3" -LessonNumber "2" -LessonTitle "Properties of Continuous Functions" -LessonContent @"
            <p>Continuous functions on closed intervals have special properties.</p>
            <div class="formula">
                <h3>Extreme Value Theorem</h3>
                <p>A continuous function on [a,b] attains its maximum and minimum.</p>
                <h3>Intermediate Value Theorem</h3>
                <p>A continuous function on [a,b] takes on every value between f(a) and f(b).</p>
            </div>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch3" -LessonNumber "3" -LessonTitle "Uniform Continuity" -LessonContent @"
            <p>Uniform continuity means the δ works for all points in the domain.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>f is uniformly continuous iff ∀ε > 0, ∃δ > 0 such that |x-y| < δ implies |f(x) - f(y)| < ε for all x,y in the domain.</p>
            </div>
            <p>Every continuous function on a closed interval is uniformly continuous.</p>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch3" -LessonNumber "4" -LessonTitle "Differentiability" -LessonContent @"
            <p>A function is differentiable at a point if the derivative exists.</p>
            <div class="formula">
                <h3>Definition</h3>
                <p>f'(a) = lim(h→0) [f(a+h) - f(a)]/h</p>
            </div>
            <p>Differentiability implies continuity, but not vice versa.</p>
"@

Create-LessonPage -Textbook "real-analysis" -Chapter "ch3" -LessonNumber "5" -LessonTitle "The Mean Value Theorem" -LessonContent @"
            <p>The Mean Value Theorem relates the derivative to the average rate of change.</p>
            <div class="formula">
                <h3>Theorem</h3>
                <p>If f is continuous on [a,b] and differentiable on (a,b), then ∃c ∈ (a,b) such that f'(c) = [f(b) - f(a)]/(b-a)</p>
            </div>
"@

Write-Host "All missing lesson pages have been generated successfully!"
