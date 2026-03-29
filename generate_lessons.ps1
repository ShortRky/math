# Script to generate all missing lesson pages
# This creates lesson pages based on the textbook index structure

# Function to create a lesson page
function Create-LessonPage {
    param(
        [string]$textbook,
        [string]$chapter,
        [string]$lessonNum,
        [string]$lessonTitle,
        [string]$lessonSummary,
        [string]$nextLesson,
        [string]$nextLessonTitle
    )

    $lessonPath = "textbooks/$textbook/$chapter/lesson$lessonNum.html"
    
    # Check if file already exists
    if (Test-Path $lessonPath) {
        Write-Host "Skipping $lessonPath - already exists"
        return
    }

    Write-Host "Creating $lessonPath"

    $content = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$lessonTitle - MathLearn</title>
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
                    <a href="../index.html" class="breadcrumb-link">$textbook</a>
                </li>
                <li class="breadcrumb-item">
                    <span class="breadcrumb-current">$lessonTitle</span>
                </li>
            </ol>
        </div>
    </div>

    <main class="lesson-container">
        <div class="lesson-header">
            <h1 class="lesson-title">$lessonTitle</h1>
            <div class="lesson-meta">
                <span>Chapter $chapter</span>
                <span>Lesson $lessonNum</span>
            </div>
        </div>

        <section class="lesson-section">
            <h2>Goal</h2>
            <div class="goal-box">
                <p>$lessonSummary</p>
            </div>
        </section>

        <section class="lesson-section">
            <h2>The Idea</h2>
            <div class="content-block">
                <p>This lesson covers the fundamental concepts of $lessonTitle. Understanding this topic is essential for mastering the material in this chapter.</p>
                
                <div class="key-concept">
                    <h3>Key Concepts</h3>
                    <ul>
                        <li>Definition and basic properties</li>
                        <li>Important theorems and formulas</li>
                        <li>Common applications</li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="lesson-section">
            <h2>Example</h2>
            <div class="example-box">
                <h3>Example Problem</h3>
                <div class="example-content">
                    <p>Let's work through a typical problem involving $lessonTitle.</p>
                    
                    <div class="step">
                        <h4>Step 1: Understand the Problem</h4>
                        <p>Identify what is given and what needs to be found.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 2: Apply the Method</h4>
                        <p>Use the appropriate technique or formula.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 3: Solve</h4>
                        <p>Carry out the calculations carefully.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 4: Verify</h4>
                        <p>Check your answer for reasonableness.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="lesson-section">
            <h2>Practice Problems</h2>
            <div class="practice-problems">
                <div class="problem">
                    <h4>Problem 1</h4>
                    <p>Apply the concepts from this lesson to solve a similar problem.</p>
                </div>
                
                <div class="problem">
                    <h4>Problem 2</h4>
                    <p>Try a slightly more challenging variation.</p>
                </div>
                
                <div class="problem">
                    <h4>Problem 3</h4>
                    <p>Test your understanding with this comprehensive problem.</p>
                </div>
            </div>
        </section>

        <section class="lesson-section">
            <h2>Summary</h2>
            <div class="summary-box">
                <p>In this lesson, we covered the essential aspects of $lessonTitle. Remember to practice these concepts regularly to build proficiency.</p>
                
                <div class="key-takeaways">
                    <h3>Key Takeaways</h3>
                    <ul>
                        <li>Master the fundamental definitions</li>
                        <li>Practice applying the main formulas</li>
                        <li>Understand the connections to other topics</li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="lesson-navigation">
            <a href="$nextLesson" class="nav-button next">
                Next: $nextLessonTitle →
            </a>
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

    # Create directory if it doesn't exist
    $dir = Split-Path $lessonPath -Parent
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    # Write the file
    $content | Out-File -FilePath $lessonPath -Encoding UTF8
}

# Generate all missing lessons for Calculus Volume 2
Write-Host "=== Generating Calculus Volume 2 Lessons ==="

# Chapter 1: Integration Techniques
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "4" -lessonTitle "Partial Fractions" -lessonSummary "Learn to integrate rational functions using partial fraction decomposition." -nextLesson "lesson5.html" -nextLessonTitle "Improper Integrals"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "5" -lessonTitle "Improper Integrals" -lessonSummary "Understand how to evaluate integrals with infinite limits or discontinuities." -nextLesson "lesson6.html" -nextLessonTitle "Applications of Integration"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "6" -lessonTitle "Applications of Integration" -lessonSummary "Apply integration techniques to solve real-world problems." -nextLesson "../ch2/lesson1.html" -nextLessonTitle "Introduction to Series"

# Chapter 2: Series and Sequences
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "2" -lessonTitle "Convergence Tests" -lessonSummary "Learn various tests to determine if a series converges or diverges." -nextLesson "lesson3.html" -nextLessonTitle "Power Series"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "3" -lessonTitle "Power Series" -lessonSummary "Understand power series and their properties." -nextLesson "lesson4.html" -nextLessonTitle "Taylor Series"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "4" -lessonTitle "Taylor Series" -lessonSummary "Learn to represent functions as infinite series." -nextLesson "lesson5.html" -nextLessonTitle "Maclaurin Series"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "5" -lessonTitle "Maclaurin Series" -lessonSummary "Study special cases of Taylor series centered at zero." -nextLesson "lesson6.html" -nextLessonTitle "Applications of Series"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "6" -lessonTitle "Applications of Series" -lessonSummary "Apply series to solve problems in calculus and beyond." -nextLesson "lesson7.html" -nextLessonTitle "Fourier Series"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "7" -lessonTitle "Fourier Series" -lessonSummary "Introduction to representing periodic functions as series." -nextLesson "../ch3/lesson1.html" -nextLessonTitle "Parametric Equations"

# Chapter 3: Parametric Equations and Polar Coordinates
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "2" -lessonTitle "Calculus with Parametric Curves" -lessonSummary "Learn to find derivatives and integrals of parametric curves." -nextLesson "lesson3.html" -nextLessonTitle "Polar Coordinates"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "3" -lessonTitle "Polar Coordinates" -lessonSummary "Understand the polar coordinate system and conversions." -nextLesson "lesson4.html" -nextLessonTitle "Calculus in Polar Coordinates"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "4" -lessonTitle "Calculus in Polar Coordinates" -lessonSummary "Apply calculus concepts to polar curves." -nextLesson "lesson5.html" -nextLessonTitle "Conic Sections"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "5" -lessonTitle "Conic Sections" -lessonSummary "Study ellipses, parabolas, and hyperbolas in polar form." -nextLesson "../../calculus-vol3/ch1/lesson1.html" -nextLessonTitle "Vectors in Space"

Write-Host "=== Generating Calculus Volume 3 Lessons ==="

# Chapter 1: Vectors and Geometry of Space
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "2" -lessonTitle "The Dot Product" -lessonSummary "Learn the dot product and its applications." -nextLesson "lesson3.html" -nextLessonTitle "The Cross Product"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "3" -lessonTitle "The Cross Product" -lessonSummary "Understand the cross product and its geometric meaning." -nextLesson "lesson4.html" -nextLessonTitle "Lines and Planes"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "4" -lessonTitle "Lines and Planes in Space" -lessonSummary "Learn to describe lines and planes using vectors." -nextLesson "lesson5.html" -nextLessonTitle "Cylindrical Coordinates"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "5" -lessonTitle "Cylindrical Coordinates" -lessonSummary "Understand the cylindrical coordinate system." -nextLesson "lesson6.html" -nextLessonTitle "Spherical Coordinates"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "6" -lessonTitle "Spherical Coordinates" -lessonSummary "Learn the spherical coordinate system and conversions." -nextLesson "../ch2/lesson1.html" -nextLessonTitle "Vector Functions"

# Chapter 2: Vector Functions
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "1" -lessonTitle "Vector Functions" -lessonSummary "Introduction to vector-valued functions." -nextLesson "lesson2.html" -nextLessonTitle "Derivatives and Integrals"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "2" -lessonTitle "Derivatives and Integrals of Vector Functions" -lessonSummary "Learn calculus of vector functions." -nextLesson "lesson3.html" -nextLessonTitle "Arc Length"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "3" -lessonTitle "Arc Length and Curvature" -lessonSummary "Calculate arc length and curvature of curves." -nextLesson "lesson4.html" -nextLessonTitle "Motion in Space"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "4" -lessonTitle "Motion in Space" -lessonSummary "Apply vector calculus to motion problems." -nextLesson "lesson5.html" -nextLessonTitle "Partial Derivatives"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "5" -lessonTitle "Partial Derivatives" -lessonSummary "Introduction to functions of multiple variables." -nextLesson "lesson6.html" -nextLessonTitle "Tangent Planes"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "6" -lessonTitle "Tangent Planes and Linear Approximations" -lessonSummary "Find tangent planes to surfaces." -nextLesson "lesson7.html" -nextLessonTitle "The Chain Rule"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "7" -lessonTitle "The Chain Rule" -lessonSummary "Extend the chain rule to functions of multiple variables." -nextLesson "../ch3/lesson1.html" -nextLessonTitle "Multiple Integrals"

# Chapter 3: Multiple Integrals
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "1" -lessonTitle "Double Integrals" -lessonSummary "Introduction to integration over two variables." -nextLesson "lesson2.html" -nextLessonTitle "Iterated Integrals"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "2" -lessonTitle "Iterated Integrals" -lessonSummary "Learn to evaluate double integrals as iterated integrals." -nextLesson "lesson3.html" -nextLessonTitle "Double Integrals in Polar"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "3" -lessonTitle "Double Integrals in Polar Coordinates" -lessonSummary "Convert double integrals to polar coordinates." -nextLesson "lesson4.html" -nextLessonTitle "Applications"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "4" -lessonTitle "Applications of Double Integrals" -lessonSummary "Use double integrals to find area, volume, and mass." -nextLesson "lesson5.html" -nextLessonTitle "Triple Integrals"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "5" -lessonTitle "Triple Integrals" -lessonSummary "Extend integration to three variables." -nextLesson "lesson6.html" -nextLessonTitle "Cylindrical and Spherical"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "6" -lessonTitle "Triple Integrals in Cylindrical and Spherical Coordinates" -lessonSummary "Evaluate triple integrals in different coordinate systems." -nextLesson "../../differential-equations/ch1/lesson1.html" -nextLessonTitle "Introduction to Differential Equations"

Write-Host "=== Generating Differential Equations Lessons ==="

# Chapter 1: First-Order Differential Equations
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "2" -lessonTitle "Separable Equations" -lessonSummary "Learn to solve separable differential equations." -nextLesson "lesson3.html" -nextLessonTitle "Linear Equations"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "3" -lessonTitle "Linear First-Order Equations" -lessonSummary "Solve linear first-order differential equations." -nextLesson "lesson4.html" -nextLessonTitle "Exact Equations"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "4" -lessonTitle "Exact Equations" -lessonSummary "Understand and solve exact differential equations." -nextLesson "lesson5.html" -nextLessonTitle "Substitution Methods"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "5" -lessonTitle "Substitution Methods" -lessonSummary "Use substitutions to solve differential equations." -nextLesson "lesson6.html" -nextLessonTitle "Numerical Methods"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "6" -lessonTitle "Numerical Methods" -lessonSummary "Introduction to numerical solutions of differential equations." -nextLesson "../ch2/lesson1.html" -nextLessonTitle "Second-Order Equations"

# Chapter 2: Second-Order Linear Equations
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "1" -lessonTitle "Second-Order Linear Equations" -lessonSummary "Introduction to second-order linear differential equations." -nextLesson "lesson2.html" -nextLessonTitle "Constant Coefficients"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "2" -lessonTitle "Constant Coefficients" -lessonSummary "Solve equations with constant coefficients." -nextLesson "lesson3.html" -nextLessonTitle "Undetermined Coefficients"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "3" -lessonTitle "Undetermined Coefficients" -lessonSummary "Method of undetermined coefficients for particular solutions." -nextLesson "lesson4.html" -nextLessonTitle "Variation of Parameters"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "4" -lessonTitle "Variation of Parameters" -lessonSummary "Alternative method for finding particular solutions." -nextLesson "lesson5.html" -nextLessonTitle "Applications"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "5" -lessonTitle "Applications of Second-Order Equations" -lessonSummary "Apply second-order equations to physical systems." -nextLesson "lesson6.html" -nextLessonTitle "Higher-Order Equations"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "6" -lessonTitle "Higher-Order Linear Equations" -lessonSummary "Extend methods to higher-order differential equations." -nextLesson "../ch3/lesson1.html" -nextLessonTitle "Laplace Transforms"

# Chapter 3: Laplace Transforms
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "1" -lessonTitle "Introduction to Laplace Transforms" -lessonSummary "Learn the definition and basic properties of Laplace transforms." -nextLesson "lesson2.html" -nextLessonTitle "Inverse Laplace Transforms"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "2" -lessonTitle "Inverse Laplace Transforms" -lessonSummary "Find inverse Laplace transforms." -nextLesson "lesson3.html" -nextLessonTitle "Solving Initial Value Problems"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "3" -lessonTitle "Solving Initial Value Problems" -lessonSummary "Use Laplace transforms to solve initial value problems." -nextLesson "lesson4.html" -nextLessonTitle "Step Functions"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "4" -lessonTitle "Step Functions" -lessonSummary "Learn about Heaviside step functions." -nextLesson "lesson5.html" -nextLessonTitle "Applications"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "5" -lessonTitle "Applications of Laplace Transforms" -lessonSummary "Apply Laplace transforms to various problems." -nextLesson "../../real-analysis/ch1/lesson1.html" -nextLessonTitle "The Real Number System"

Write-Host "=== Generating Real Analysis Lessons ==="

# Chapter 1: The Real Number System
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "2" -lessonTitle "Properties of Real Numbers" -lessonSummary "Study the algebraic and order properties of real numbers." -nextLesson "lesson3.html" -nextLessonTitle "Completeness"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "3" -lessonTitle "The Completeness Axiom" -lessonSummary "Understand the completeness property of real numbers." -nextLesson "lesson4.html" -nextLessonTitle "Sequences"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "4" -lessonTitle "Introduction to Sequences" -lessonSummary "Learn basic concepts of sequences." -nextLesson "lesson5.html" -nextLessonTitle "Convergence"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "5" -lessonTitle "Convergence of Sequences" -lessonSummary "Study convergence and divergence of sequences." -nextLesson "../ch2/lesson1.html" -nextLessonTitle "Limits and Continuity"

# Chapter 2: Limits and Continuity
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "1" -lessonTitle "Limits of Functions" -lessonSummary "Rigorous definition of limits." -nextLesson "lesson2.html" -nextLessonTitle "Continuity"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "2" -lessonTitle "Continuity" -lessonSummary "Study continuous functions and their properties." -nextLesson "lesson3.html" -nextLessonTitle "Properties of Continuous Functions"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "3" -lessonTitle "Properties of Continuous Functions" -lessonSummary "Learn important theorems about continuous functions." -nextLesson "lesson4.html" -nextLessonTitle "Uniform Continuity"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "4" -lessonTitle "Uniform Continuity" -lessonSummary "Understand uniform continuity and its significance." -nextLesson "lesson5.html" -nextLessonTitle "Differentiation"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "5" -lessonTitle "Differentiation" -lessonSummary "Rigorous treatment of derivatives." -nextLesson "lesson6.html" -nextLessonTitle "Mean Value Theorem"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "6" -lessonTitle "The Mean Value Theorem" -lessonSummary "Study the mean value theorem and its applications." -nextLesson "../ch3/lesson1.html" -nextLessonTitle "The Riemann Integral"

# Chapter 3: The Riemann Integral
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "1" -lessonTitle "The Riemann Integral" -lessonSummary "Introduction to the Riemann integral." -nextLesson "lesson2.html" -nextLessonTitle "Properties of the Integral"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "2" -lessonTitle "Properties of the Riemann Integral" -lessonSummary "Learn properties of the Riemann integral." -nextLesson "lesson3.html" -nextLessonTitle "Fundamental Theorem"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "3" -lessonTitle "The Fundamental Theorem of Calculus" -lessonSummary "Rigorous proof of the fundamental theorem." -nextLesson "lesson4.html" -nextLessonTitle "Improper Integrals"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "4" -lessonTitle "Improper Integrals" -lessonSummary "Study improper integrals and convergence." -nextLesson "lesson5.html" -nextLessonTitle "Series"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "5" -lessonTitle "Introduction to Series" -lessonSummary "Begin the study of infinite series." -nextLesson "../../index.html" -nextLessonTitle "Back to Home"

Write-Host "=== Lesson generation complete! ==="
Write-Host "All missing lesson pages have been created."
