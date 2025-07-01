module.exports = {
  content: [
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{erb,rb}',
    './config/initializers/simple_form_tailwind.rb',
  ],
  theme: {
    extend: {
      animation: {
        'card-reveal': 'card-reveal 1.5s ease-out',
        'gentle-float': 'gentle-float 2s ease-in-out infinite',
      },
      keyframes: {
        'card-reveal': {
          '0%': { 
            transform: 'scale(0.8) rotateY(180deg)', 
            opacity: '0' 
          },
          '50%': { 
            transform: 'scale(1.1) rotateY(90deg)', 
            opacity: '0.5' 
          },
          '100%': { 
            transform: 'scale(1) rotateY(0deg)', 
            opacity: '1' 
          }
        },
        'gentle-float': {
          '0%, 100%': { transform: 'translateY(0px) rotate(0deg)' },
          '33%': { transform: 'translateY(-3px) rotate(1deg)' },
          '66%': { transform: 'translateY(-1px) rotate(-0.5deg)' }
        }
      }
    },
  },
  plugins: [],
} 