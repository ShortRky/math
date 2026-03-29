/**
 * MathLearn - Main JavaScript
 * Handles animations, interactivity, and accessibility
 */

(function() {
    'use strict';

    // ============================================
    // Configuration
    // ============================================
    const CONFIG = {
        animationDuration: 300,
        reducedMotion: window.matchMedia('(prefers-reduced-motion: reduce)').matches
    };

    // ============================================
    // Utility Functions
    // ============================================
    
    /**
     * Debounce function to limit how often a function can fire
     */
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    /**
     * Check if element is in viewport
     */
    function isInViewport(element) {
        const rect = element.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    /**
     * Animate element when it enters viewport
     */
    function animateOnScroll() {
        if (CONFIG.reducedMotion) return;
        
        const elements = document.querySelectorAll('.animate-in');
        elements.forEach(element => {
            if (isInViewport(element) && !element.classList.contains('animated')) {
                element.classList.add('animated');
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }
        });
    }

    // ============================================
    // Chapter Accordion
    // ============================================
    
    function initChapterAccordion() {
        const chapterHeaders = document.querySelectorAll('.chapter-header');
        
        chapterHeaders.forEach(header => {
            header.addEventListener('click', function() {
                const chapterCard = this.closest('.chapter-card');
                const isExpanded = chapterCard.classList.contains('expanded');
                
                // Close all other chapters (optional - remove for multi-open)
                // document.querySelectorAll('.chapter-card').forEach(card => {
                //     card.classList.remove('expanded');
                // });
                
                // Toggle current chapter
                if (isExpanded) {
                    chapterCard.classList.remove('expanded');
                    this.setAttribute('aria-expanded', 'false');
                } else {
                    chapterCard.classList.add('expanded');
                    this.setAttribute('aria-expanded', 'true');
                    
                    // Animate content if motion is allowed
                    if (!CONFIG.reducedMotion) {
                        const content = chapterCard.querySelector('.chapter-content');
                        content.style.animation = `slideDown ${CONFIG.animationDuration}ms ease-out`;
                    }
                }
            });
            
            // Keyboard accessibility
            header.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.click();
                }
            });
            
            // Set initial ARIA attributes
            header.setAttribute('role', 'button');
            header.setAttribute('aria-expanded', 'false');
            header.setAttribute('tabindex', '0');
        });
    }

    // ============================================
    // Smooth Scrolling
    // ============================================
    
    function initSmoothScrolling() {
        if (CONFIG.reducedMotion) return;
        
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href === '#') return;
                
                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                    
                    // Update URL without jumping
                    history.pushState(null, null, href);
                }
            });
        });
    }

    // ============================================
    // Math Highlight Animation
    // ============================================
    
    function initMathHighlight() {
        if (CONFIG.reducedMotion) return;
        
        const mathElements = document.querySelectorAll('.math-display');
        
        mathElements.forEach(element => {
            element.addEventListener('click', function() {
                this.classList.add('highlight-pulse');
                setTimeout(() => {
                    this.classList.remove('highlight-pulse');
                }, 1000);
            });
            
            // Add cursor pointer to indicate it's interactive
            element.style.cursor = 'pointer';
            element.setAttribute('title', 'Click to highlight');
        });
    }

    // ============================================
    // Step-by-Step Animation
    // ============================================
    
    function initStepAnimation() {
        if (CONFIG.reducedMotion) return;
        
        const stepGuides = document.querySelectorAll('.step-guide ol li');
        
        stepGuides.forEach((step, index) => {
            step.style.opacity = '0';
            step.style.transform = 'translateX(-10px)';
            
            setTimeout(() => {
                step.style.transition = `opacity ${CONFIG.animationDuration}ms ease, transform ${CONFIG.animationDuration}ms ease`;
                step.style.opacity = '1';
                step.style.transform = 'translateX(0)';
            }, index * 100);
        });
    }

    // ============================================
    // Keyboard Navigation
    // ============================================
    
    function initKeyboardNavigation() {
        // Add keyboard navigation for textbook cards
        const textbookCards = document.querySelectorAll('.textbook-card');
        
        textbookCards.forEach(card => {
            card.addEventListener('keydown', function(e) {
                if (e.key === 'Enter') {
                    window.location.href = this.getAttribute('href');
                }
            });
        });
        
        // Add keyboard navigation for lesson links
        const lessonLinks = document.querySelectorAll('.lesson-link');
        
        lessonLinks.forEach(link => {
            link.addEventListener('keydown', function(e) {
                if (e.key === 'Enter') {
                    window.location.href = this.getAttribute('href');
                }
            });
        });
    }

    // ============================================
    // Progress Indicator
    // ============================================
    
    function initProgressIndicator() {
        const lessonSections = document.querySelectorAll('.lesson-section');
        
        if (lessonSections.length === 0) return;
        
        // Create progress bar
        const progressBar = document.createElement('div');
        progressBar.className = 'reading-progress';
        progressBar.innerHTML = '<div class="reading-progress-bar"></div>';
        progressBar.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: rgba(0, 0, 0, 0.1);
            z-index: 1000;
        `;
        
        const progressBarFill = progressBar.querySelector('.reading-progress-bar');
        progressBarFill.style.cssText = `
            height: 100%;
            width: 0%;
            background-color: var(--color-secondary);
            transition: width 100ms ease;
        `;
        
        document.body.prepend(progressBar);
        
        // Update progress on scroll
        const updateProgress = debounce(() => {
            const scrollTop = window.scrollY;
            const docHeight = document.documentElement.scrollHeight - window.innerHeight;
            const progress = (scrollTop / docHeight) * 100;
            progressBarFill.style.width = `${Math.min(progress, 100)}%`;
        }, 10);
        
        window.addEventListener('scroll', updateProgress);
    }

    // ============================================
    // Tooltip for Difficulty Ratings
    // ============================================
    
    function initTooltips() {
        const difficultyBadges = document.querySelectorAll('.difficulty');
        
        difficultyBadges.forEach(badge => {
            const difficulty = badge.classList.contains('beginner') ? 'beginner' :
                             badge.classList.contains('intermediate') ? 'intermediate' : 'advanced';
            
            const tooltips = {
                beginner: 'No prior knowledge required. We start from the basics.',
                intermediate: 'Some foundational knowledge recommended.',
                advanced: 'Requires strong understanding of prerequisite topics.'
            };
            
            badge.setAttribute('title', tooltips[difficulty]);
            badge.style.cursor = 'help';
        });
    }

    // ============================================
    // Print Styles
    // ============================================
    
    function initPrintStyles() {
        // Add print button if on lesson page
        const lessonContainer = document.querySelector('.lesson-container');
        
        if (lessonContainer) {
            const printButton = document.createElement('button');
            printButton.className = 'print-button';
            printButton.innerHTML = '🖨️ Print Lesson';
            printButton.style.cssText = `
                position: fixed;
                bottom: 20px;
                right: 20px;
                padding: 12px 20px;
                background-color: var(--color-secondary);
                color: white;
                border: none;
                border-radius: var(--radius-md);
                cursor: pointer;
                font-family: var(--font-sans);
                font-size: 14px;
                font-weight: 500;
                box-shadow: var(--shadow-lg);
                transition: transform var(--transition-fast), box-shadow var(--transition-fast);
                z-index: 100;
            `;
            
            printButton.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
                this.style.boxShadow = 'var(--shadow-xl)';
            });
            
            printButton.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = 'var(--shadow-lg)';
            });
            
            printButton.addEventListener('click', () => {
                window.print();
            });
            
            document.body.appendChild(printButton);
        }
    }

    // ============================================
    // Table of Contents Generator
    // ============================================
    
    function initTableOfContents() {
        const lessonContainer = document.querySelector('.lesson-container');
        
        if (!lessonContainer) return;
        
        const headings = lessonContainer.querySelectorAll('h2');
        
        if (headings.length < 2) return;
        
        const toc = document.createElement('nav');
        toc.className = 'table-of-contents';
        toc.innerHTML = '<h4>On This Page</h4><ul></ul>';
        toc.style.cssText = `
            position: sticky;
            top: calc(var(--header-height) + 20px);
            background-color: var(--color-bg-alt);
            padding: var(--space-lg);
            border-radius: var(--radius-md);
            border: 1px solid var(--color-border);
            margin-bottom: var(--space-xl);
        `;
        
        const tocList = toc.querySelector('ul');
        tocList.style.cssText = `
            list-style: none;
            margin: 0;
            padding: 0;
        `;
        
        headings.forEach((heading, index) => {
            const id = `section-${index}`;
            heading.id = id;
            
            const li = document.createElement('li');
            li.style.cssText = `
                margin-bottom: var(--space-sm);
            `;
            
            const a = document.createElement('a');
            a.href = `#${id}`;
            a.textContent = heading.textContent;
            a.style.cssText = `
                color: var(--color-text-light);
                text-decoration: none;
                font-size: 0.9375rem;
                transition: color var(--transition-fast);
            `;
            
            a.addEventListener('mouseenter', function() {
                this.style.color = 'var(--color-secondary)';
            });
            
            a.addEventListener('mouseleave', function() {
                this.style.color = 'var(--color-text-light)';
            });
            
            li.appendChild(a);
            tocList.appendChild(li);
        });
        
        // Insert TOC after the header
        const lessonHeader = lessonContainer.querySelector('.lesson-header');
        if (lessonHeader) {
            lessonHeader.after(toc);
        }
    }

    // ============================================
    // Initialize Everything
    // ============================================
    
    function init() {
        // Initialize all features
        initChapterAccordion();
        initSmoothScrolling();
        initMathHighlight();
        initKeyboardNavigation();
        initTooltips();
        initPrintStyles();
        initTableOfContents();
        
        // Initialize scroll-based animations
        if (!CONFIG.reducedMotion) {
            window.addEventListener('scroll', debounce(animateOnScroll, 10));
            animateOnScroll(); // Initial check
        }
        
        // Initialize step animation on lesson pages
        if (document.querySelector('.step-guide')) {
            initStepAnimation();
        }
        
        // Initialize progress indicator on lesson pages
        if (document.querySelector('.lesson-section')) {
            initProgressIndicator();
        }
        
        console.log('MathLearn initialized successfully');
    }

    // Run initialization when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

    // ============================================
    // Export for potential module use
    // ============================================
    
    window.MathLearn = {
        CONFIG,
        init,
        debounce,
        isInViewport
    };

})();
