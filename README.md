# Daily Hogwarts

This is a simple, fun, and engaging app designed to immerse Harry Potter fans in the magic of the wizarding world through daily interactions. With spell-swiping, character trivia, and personalized house features, users can explore the wizarding world through an intuitive interface. This project is still under development, with mock data and several exciting features on the roadmap.

## App structure from schema to real life

![screenshot](./assets/app_schema.svg)

## Key Features

### Spells

- **Description:** Users can go through different spells with its description and usage. They can swipe through spell cards. Swipe right to "cast" a spell, swipe left to dismiss it. Once all spells have been swiped, users receive a message that the charms class is over, and they can reset the stack with a repeat button.
- **Purpose:** Learn about new spells and expand your magical knowledge.

### Characters

- **Description:** Explore trivia about Hogwarts staff and students, including details about their ancestry, wand, house, and Patronus.
- **Purpose:** Discover or rediscover characters from the Harry Potter universe and learn details about them.

### Settings

- **Description:** Users can switch between light and dark themes. The app will persist the selected theme across sessions. The app supports multiple languages, and users can easily change the language.
- **Purpose:** Personalize the user experience, making the app accessible to a global audience.

### Firebase Authentication

- **Description:** Users can sign up and log in using their email and password. Firebase handles authentication, which personalizes the experience by storing user data. Once sorted into a house, the app applies that house's color scheme and flags.
- **Purpose:** Personalize the user experience.

## Limitations

- **Mock Data:** Currently, spells are mocked, and no persistent data is stored for spells or user-specific preferences.
- **No Shared Preferences:** The app currently lacks shared preferences to persist theme and language settings.
- **Limited Firebase Features:** Firebase is used for user authentication and storing house data. There's no Firestore database integration for storing more detailed information yet.
- **On-launch Authentication Mechanism:** The app does not yet have a mechanism that automatically checks if the user is authenticated and redirects them to the home screen upon app launch if they are already logged in.

## Roadmap Features

- **Spellcasting Animations:** Future updates will include detailed animations to enhance the spellcasting experience.
- **Theme & Language Preferences:** A mechanism (such as shared preferences) will be added to save the user's theme and language settings.
