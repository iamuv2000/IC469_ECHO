/* eslint-disable prefer-promise-reject-errors */
const responses = require('../../configs/responses.js')

const articles = {
  jogging: [
    {
      title: 'The Subtle Art Of Jogging',
      link: 'https://medium.com/runners-life/the-subtle-art-of-jogging-dcbc093fdcd5'
    }, {
      title: 'This One Trick Will Help You Actually Feel Good When You Run',
      link: 'https://medium.com/runners-life/this-one-trick-will-help-you-actually-feel-good-when-you-run-ecb9f8a26b50'
    }
  ],
  exercise: [
    {
      title: 'Get Your Exercise Mojo Back Now',
      link: 'https://thinktank.neurogum.com/get-your-exercise-mojo-back-now-fc4496001239'
    },
    {
      title: 'This One-Minute Exercise Can Seriously Boost Your Mood',
      link: 'https://psiloveyou.xyz/immediately-improve-your-mood-with-this-simple-one-minute-exercise-5bbdabfa9e71'
    }
  ],
  meditate: [
    {
      title: 'How to Meditate When You Can’t Shut Your Mind Off',
      link: 'https://humanparts.medium.com/how-to-keep-your-meditation-practice-alive-f402c42b6104'
    },
    {
      title: 'Why You Should Meditate Like The Dalai Lama',
      link: 'https://medium.com/personal-growth/why-you-should-meditate-like-a-motherf-cker-6e98f60f9d55'
    }
  ],
  paint: [
    {
      title: 'How to Paint Vivid Pictures with Your Words',
      link: 'https://medium.com/copywriting-secrets/how-to-paint-vivid-pictures-with-your-words-67aa70c00830'
    }
  ],
  read: [
    {
      title: 'Crowdsource Your Reading List From People You Admire',
      link: 'https://humanparts.medium.com/this-question-will-change-your-reading-life-a28c622c0c25'
    },
    {
      title: 'The Complete Guide to Effective Reading',
      link: 'https://medium.com/@maartenvandoorn/the-complete-guide-to-effective-reading-fc1835937757'
    }
  ],
  code: [
    {
      title: 'Tools I wish I had known about when I started coding',
      link: 'https://medium.com/free-code-camp/tools-i-wish-i-had-known-about-when-i-started-coding-57849efd9248'
    },
    {
      title: 'The 100% Correct Coding Style Guide',
      link: 'https://medium.com/free-code-camp/the-100-correct-coding-style-guide-5b594a1655f0'
    }
  ],
  games: [
    {
      title: 'In the Future, Senior Citizens Will Play Video Games All Day',
      link: 'https://onezero.medium.com/in-the-future-senior-citizens-will-play-video-games-all-day-23794b532447'
    },
    {
      title: '10 Must See Web Apps & Games',
      link: 'https://medium.com/javascript-scene/10-must-see-web-apps-games-36ab9ca60754'
    }
  ],
  socialize: [
    {
      title: 'How To Take Back Control Of Your Day',
      link: 'https://medium.com/publishous/how-to-take-back-control-of-your-day-dbd7dd4f1c8a'
    },
    {
      title: 'Can I whisper in your ear what you always wanted to hear?',
      link: 'https://medium.com/hopes-and-dreams-for-our-future/can-i-whisper-in-your-ear-what-you-always-wanted-to-hear-6b1c9fecfcd7'
    }
  ],
  socialMedia: [
    {
      title: 'While Everyone Is Distracted By Social Media, Successful People Double Down On An Underrated Skill',
      link: 'https://medium.com/accelerated-intelligence/while-everyone-is-distracted-by-social-media-successful-people-double-down-on-a-totally-underrated-5a86701e9a27'
    },
    {
      title: 'Two Things You Should Focus On Instead of Social Media',
      link: 'https://medium.com/personal-growth/two-things-you-should-focus-on-instead-of-social-media-4b3dd86bef7b'
    }
  ],
  goodSleep: [
    {
      title: 'After Two Years Off-Grid, I’m Embracing Daily Letters, Good Sleep and My DIY Hot Tub',
      link: 'https://medium.com/the-guardian/after-two-years-off-grid-im-embracing-daily-letters-good-sleep-and-my-diy-hot-tub-9aff9f5c5819'
    },
    {
      title: 'The Everything Guide to Getting Good Sleep',
      link: 'https://medium.com/better-humans/the-everything-guide-to-good-sleep-2cfb965b07f8'
    }
  ],
  badSleep: [
    {
      title: 'The Everything Guide to Getting Good Sleep',
      link: 'https://medium.com/better-humans/the-everything-guide-to-good-sleep-2cfb965b07f8'
    },
    {
      title: 'How To Get Back To Sleep After Waking Up In The Middle of The Night — Get Good Sleep',
      link: 'https://thecreative.cafe/how-to-get-back-to-sleep-after-waking-up-in-the-middle-of-the-night-get-good-sleep-9260ff5d44e3'
    }
  ],
  moderateSleep: [
    {
      title: '1 Easy Trick to Massively Improve Your Sleep Quality',
      link: 'https://medium.com/the-ascent/1-easy-trick-to-massively-improve-your-sleep-quality-916242d95498'
    },
    {
      title: 'Sleep Your Way to the Top',
      link: 'https://medium.com/s/story/sleep-your-way-to-the-top-debf3fd215c6'
    }
  ],
  netflix: [
    {
      title: 'Bloodline is a Dramatic TV Show on Netflix',
      link: 'https://medium.com/flicks-tv-hound/bloodline-is-a-dramatic-tv-show-on-netflix-4796ae2e791d'
    },
    {
      title: '3 TV shows that touch on mental illness appropriately #wellness',
      link: 'https://medium.com/@JoyceDuboise/3-tv-shows-that-touch-on-mental-illness-appropriately-wellness-9a5b0091266a'
    }
  ],
  smoke: [
    {
      title: 'Techniques to Quit Smoking by Making Peace With Your Emotions',
      link: 'https://medium.com/better-humans/techniques-to-quit-smoking-by-making-peace-with-your-emotions-ea9c19d9648d'
    },
    {
      title: 'I’ll Smoke When I’m Dead',
      link: 'https://medium.com/@theemilyhopkins/ill-smoke-when-im-dead-8f70feee9a90'
    }
  ],
  junkFood: [
    {
      title: 'Craving Junk Food? Here Are The 2 Most Common Reasons',
      link: 'https://fityourself.club/craving-junk-food-here-are-the-2-most-common-reasons-ba6b5a343afd'
    },
    {
      title: 'How to Reduce Cravings for Junk Food in 5 Easy Steps',
      link: 'https://medium.com/gethealthy/how-to-reduce-cravings-for-junk-food-in-5-easy-steps-19563c7c42cb?source=search_post'
    }
  ]
}

const GetArticlesHandler = (activities) => {
  return new Promise((resolve, reject) => {
    try {
      const keys = Object.keys(articles)
      const filteredActivities = activities.filter((keyword) => keys.includes(keyword))
      var filteredArticles = []
      filteredActivities.forEach((keyword) => {
        filteredArticles = [...filteredArticles, ...articles[keyword]]
      })
      filteredArticles = [...filteredArticles, ...articles.meditate]
      resolve({
        statusCode: 200,
        serverMessage: responses['200'],
        payload: {
          articles: filteredArticles
        },
        error: null
      })
    } catch (err) {
      console.log(err.message)
      reject({
        statusCode: 500,
        serverMessage: responses['500'],
        payload: {},
        error: 'Server Side Error'
      })
    }
  })
}

module.exports = GetArticlesHandler
