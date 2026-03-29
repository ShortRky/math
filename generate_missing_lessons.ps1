# Script to generate all missing lesson pages
$baseDir = "textbooks"

# Function to create a lesson page
function Create-LessonPage {
    param(
        [string]$textbook,
        [string]$chapter,
        [string]$lessonNum,
        [string]$lessonTitle,
        [string]$lessonSummary,
        [string]$nextLesson,
        [string]$prevLesson
    )

    $lessonPath = "$baseDir/$textbook/$chapter/lesson$lessonNum.html"
    
    # Create directory if it doesn't exist
    $dir = Split-Path $lessonPath -Parent
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    $html = @"
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
                <p>This lesson covers the fundamental concepts of $lessonTitle. Understanding this topic is essential for building a strong foundation in mathematics.</p>
                
                <div class="key-concept">
                    <h3>Key Concepts</h3>
                    <ul>
                        <li>Definition and basic properties</li>
                        <li>Important formulas and theorems</li>
                        <li>Common applications</li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="lesson-section">
            <h2>Example</h2>
            <div class="example-box">
                <h3>Example 1</h3>
                <div class="example-content">
                    <p>Let's work through a step-by-step example to understand how to apply the concepts from this lesson.</p>
                    
                    <div class="step">
                        <h4>Step 1: Understand the Problem</h4>
                        <p>Read the problem carefully and identify what is being asked.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 2: Identify the Approach</h4>
                        <p>Determine which method or formula to use.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 3: Apply the Method</h4>
                        <p>Execute the solution step by step.</p>
                    </div>
                    
                    <div class="step">
                        <h4>Step 4: Verify the Answer</h4>
                        <p>Check your work and ensure the solution makes sense.</p>
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
                <p>In this lesson, you learned about $lessonTitle. Remember to practice these concepts regularly to build proficiency.</p>
                
                <div class="key-takeaways">
                    <h3>Key Takeaways</h3>
                    <ul>
                        <li>Master the fundamental definitions</li>
                        <li>Practice applying the formulas</li>
                        <li>Connect concepts to real-world applications</li>
                    </ul>
                </div>
            </div>
        </section>

        <div class="lesson-navigation">
            <div class="nav-prev">
                <a href="$prevLesson" class="nav-button">← Previous Lesson</a>
            </div>
            <div class="nav-next">
                <a href="$nextLesson" class="nav-button">Next Lesson →</a>
            </div>
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

    Set-Content -Path $lessonPath -Value $html
    Write-Host "Created: $lessonPath"
}

# Calculus Volume 2 - Chapter 1 (Integration Techniques)
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "4" -lessonTitle "Partial Fractions" -lessonSummary "Learn how to decompose rational functions into simpler fractions for easier integration." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "5" -lessonTitle "Improper Integrals" -lessonSummary "Understand how to evaluate integrals with infinite limits or discontinuities." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch1" -lessonNum "6" -lessonTitle "Integration Strategies" -lessonSummary "Develop a systematic approach to choosing the right integration technique." -nextLesson "../ch2/lesson1.html" -prevLesson "lesson5.html"

# Calculus Volume 2 - Chapter 2 (Applications of Integration)
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "2" -lessonTitle "Volumes of Revolution" -lessonSummary "Calculate volumes of solids formed by rotating regions around an axis." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "3" -lessonTitle "Arc Length and Surface Area" -lessonSummary "Find the length of curves and surface areas of revolution." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "4" -lessonTitle "Work and Energy" -lessonSummary "Apply integration to calculate work done by variable forces." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "5" -lessonTitle "Center of Mass" -lessonSummary "Find the centroid and center of mass using integration." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "6" -lessonTitle "Probability and Integration" -lessonSummary "Explore probability density functions and expected values." -nextLesson "lesson7.html" -prevLesson "lesson5.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch2" -lessonNum "7" -lessonTitle "Applications Summary" -lessonSummary "Review and practice all applications of integration." -nextLesson "../ch3/lesson1.html" -prevLesson "lesson6.html"

# Calculus Volume 2 - Chapter 3 (Differential Equations)
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "2" -lessonTitle "Separable Equations" -lessonSummary "Solve differential equations by separating variables." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "3" -lessonTitle "Linear First-Order Equations" -lessonSummary "Use integrating factors to solve linear differential equations." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "4" -lessonTitle "Applications of Differential Equations" -lessonSummary "Model real-world phenomena using differential equations." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol2" -chapter "ch3" -lessonNum "5" -lessonTitle "Numerical Methods" -lessonSummary "Approximate solutions to differential equations numerically." -nextLesson "../../calculus-vol3/ch1/lesson1.html" -prevLesson "lesson4.html"

# Calculus Volume 3 - Chapter 1 (Vectors and Geometry of Space)
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "2" -lessonTitle "The Dot Product" -lessonSummary "Understand the dot product and its applications to angles and projections." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "3" -lessonTitle "The Cross Product" -lessonSummary "Learn the cross product and its geometric interpretation." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "4" -lessonTitle "Lines and Planes in Space" -lessonSummary "Describe lines and planes using vector equations." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "5" -lessonTitle "Cylindrical and Spherical Coordinates" -lessonSummary "Work with alternative coordinate systems in three dimensions." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch1" -lessonNum "6" -lessonTitle "Vector-Valued Functions" -lessonSummary "Explore functions that output vectors and their derivatives." -nextLesson "../ch2/lesson1.html" -prevLesson "lesson5.html"

# Calculus Volume 3 - Chapter 2 (Partial Derivatives)
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "1" -lessonTitle "Functions of Several Variables" -lessonSummary "Understand functions that take multiple inputs and their domains." -nextLesson "lesson2.html" -prevLesson "../ch1/lesson6.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "2" -lessonTitle "Limits and Continuity" -lessonSummary "Extend limit concepts to functions of multiple variables." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "3" -lessonTitle "Partial Derivatives" -lessonSummary "Calculate rates of change with respect to each variable." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "4" -lessonTitle "Tangent Planes and Linear Approximation" -lessonSummary "Find tangent planes and use linearization for approximation." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "5" -lessonTitle "The Chain Rule" -lessonSummary "Apply the chain rule to composite functions of several variables." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "6" -lessonTitle "Directional Derivatives and the Gradient" -lessonSummary "Find rates of change in any direction and understand the gradient vector." -nextLesson "lesson7.html" -prevLesson "lesson5.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch2" -lessonNum "7" -lessonTitle "Optimization" -lessonSummary "Find maximum and minimum values of functions of several variables." -nextLesson "../ch3/lesson1.html" -prevLesson "lesson6.html"

# Calculus Volume 3 - Chapter 3 (Multiple Integrals)
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "1" -lessonTitle "Double Integrals" -lessonSummary "Extend integration to functions of two variables." -nextLesson "lesson2.html" -prevLesson "../ch2/lesson7.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "2" -lessonTitle "Double Integrals in Polar Coordinates" -lessonSummary "Evaluate double integrals using polar coordinates." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "3" -lessonTitle "Applications of Double Integrals" -lessonSummary "Use double integrals to find area, volume, and mass." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "4" -lessonTitle "Triple Integrals" -lessonSummary "Extend integration to functions of three variables." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "5" -lessonTitle "Triple Integrals in Cylindrical and Spherical Coordinates" -lessonSummary "Evaluate triple integrals using cylindrical and spherical coordinates." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "calculus-vol3" -chapter "ch3" -lessonNum "6" -lessonTitle "Change of Variables" -lessonSummary "Use the Jacobian to transform multiple integrals." -nextLesson "../../differential-equations/ch1/lesson1.html" -prevLesson "lesson5.html"

# Differential Equations - Chapter 1 (First-Order Equations)
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "2" -lessonTitle "Separable Equations" -lessonSummary "Solve differential equations by separating variables." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "3" -lessonTitle "Linear First-Order Equations" -lessonSummary "Use integrating factors to solve linear differential equations." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "4" -lessonTitle "Exact Equations" -lessonSummary "Identify and solve exact differential equations." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "5" -lessonTitle "Substitution Methods" -lessonSummary "Use substitutions to transform and solve differential equations." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch1" -lessonNum "6" -lessonTitle "Numerical Methods" -lessonSummary "Approximate solutions using Euler's method and other techniques." -nextLesson "../ch2/lesson1.html" -prevLesson "lesson5.html"

# Differential Equations - Chapter 2 (Second-Order Equations)
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "1" -lessonTitle "Second-Order Linear Equations" -lessonSummary "Understand the theory of second-order linear differential equations." -nextLesson "lesson2.html" -prevLesson "../ch1/lesson6.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "2" -lessonTitle "Homogeneous Equations with Constant Coefficients" -lessonSummary "Solve second-order equations with constant coefficients." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "3" -lessonTitle "Non-Homogeneous Equations" -lessonSummary "Find particular solutions using undetermined coefficients." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "4" -lessonTitle "Variation of Parameters" -lessonSummary "Use variation of parameters to find particular solutions." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "5" -lessonTitle "Applications of Second-Order Equations" -lessonSummary "Model oscillations and other physical systems." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch2" -lessonNum "6" -lessonTitle "Forced Vibrations and Resonance" -lessonSummary "Analyze forced oscillations and resonance phenomena." -nextLesson "../ch3/lesson1.html" -prevLesson "lesson5.html"

# Differential Equations - Chapter 3 (Laplace Transforms)
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "1" -lessonTitle "Introduction to Laplace Transforms" -lessonSummary "Learn the definition and basic properties of Laplace transforms." -nextLesson "lesson2.html" -prevLesson "../ch2/lesson6.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "2" -lessonTitle "Inverse Laplace Transforms" -lessonSummary "Find inverse Laplace transforms using tables and properties." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "3" -lessonTitle "Solving Initial Value Problems" -lessonSummary "Use Laplace transforms to solve initial value problems." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "4" -lessonTitle "Step Functions and Translations" -lessonSummary "Work with Heaviside step functions and the translation theorem." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "differential-equations" -chapter "ch3" -lessonNum "5" -lessonTitle "Applications of Laplace Transforms" -lessonSummary "Apply Laplace transforms to solve various differential equations." -nextLesson "../../real-analysis/ch1/lesson1.html" -prevLesson "lesson4.html"

# Real Analysis - Chapter 1 (The Real Number System)
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "2" -lessonTitle "Properties of Real Numbers" -lessonSummary "Explore the algebraic and order properties of real numbers." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "3" -lessonTitle "The Completeness Axiom" -lessonSummary "Understand the completeness property and its implications." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "4" -lessonTitle "Sequences of Real Numbers" -lessonSummary "Study convergence and properties of sequences." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch1" -lessonNum "5" -lessonTitle "Subsequences and Bolzano-Weierstrass" -lessonSummary "Learn about subsequences and the Bolzano-Weierstrass theorem." -nextLesson "../ch2/lesson1.html" -prevLesson "lesson4.html"

# Real Analysis - Chapter 2 (Limits and Continuity)
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "1" -lessonTitle "Limits of Functions" -lessonSummary "Define limits rigorously using epsilon-delta definitions." -nextLesson "lesson2.html" -prevLesson "../ch1/lesson5.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "2" -lessonTitle "Continuous Functions" -lessonSummary "Study continuity and its properties." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "3" -lessonTitle "Properties of Continuous Functions" -lessonSummary "Explore the intermediate value theorem and extreme value theorem." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "4" -lessonTitle "Uniform Continuity" -lessonSummary "Understand uniform continuity and its distinction from pointwise continuity." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "5" -lessonTitle "Monotone Functions" -lessonStudy "Study properties of monotone functions and their discontinuities." -nextLesson "lesson6.html" -prevLesson "lesson4.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch2" -lessonNum "6" -lessonTitle "Limits and Continuity Summary" -lessonSummary "Review and practice all concepts from this chapter." -nextLesson "../ch3/lesson1.html" -prevLesson "lesson5.html"

# Real Analysis - Chapter 3 (Differentiation)
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "1" -lessonTitle "The Derivative" -lessonSummary "Define the derivative rigorously and explore its properties." -nextLesson "lesson2.html" -prevLesson "../ch2/lesson6.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "2" -lessonTitle "Differentiation Rules" -lessonSummary "Apply rules for differentiating sums, products, and quotients." -nextLesson "lesson3.html" -prevLesson "lesson1.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "3" -lessonTitle "The Mean Value Theorem" -lessonSummary "Understand and apply the mean value theorem." -nextLesson "lesson4.html" -prevLesson "lesson2.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "4" -lessonTitle "L'Hôpital's Rule" -lessonSummary "Use L'Hôpital's rule to evaluate indeterminate forms." -nextLesson "lesson5.html" -prevLesson "lesson3.html"
Create-LessonPage -textbook "real-analysis" -chapter "ch3" -lessonNum "5" -lessonTitle "Taylor's Theorem" -lessonSummary "Learn Taylor's theorem and polynomial approximations." -nextLesson "../../index.html" -prevLesson "lesson4.html"

Write-Host "All missing lesson pages have been created!"
