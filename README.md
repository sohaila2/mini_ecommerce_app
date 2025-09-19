git clone https://github.com/sohaila2/mini_ecommerce_app.git
cd mini_ecommerce

# 🔗 API Endpoints Used

Currently, this project uses mock / hardcoded data (or local JSON).
If you connect to an API, list them here:

GET /products → Fetch all products

GET /categories → Fetch product categories


# 📂 Folder Structure

lib/
│
├── core/                      # Shared app-wide utilities
│   ├── di/                    # Dependency injection setup (get_it, providers)
│   ├── helpers/               # Helper functions, utils
│   ├── networking/            # API client, interceptors, endpoints
│   ├── routing/               # Route names & navigation helpers
│   ├── theming/               # App themes (light/dark)
│   └── widgets/               # Global reusable widgets
│
├── features/                  # Feature-based structure
│   ├── products/              # Products feature
│   │   ├── data/              # Data layer
│   │   │   ├── models/        # Product models
│   │   │   ├── apis/          # API services
│   │   │   └── repositories/  # Repository implementation
│   │   └── presentation/      # UI layer
│   │       ├── screens/       # Product screens
│   │       ├── widgets/       # Product-specific widgets
│   │       └── bloc/          # Product cubit & states
│   │
│   ├── cart/                  # Cart feature
│   │   ├── data/              # Cart models, repos
│   │   └── Ui/                # Cart screens & widgets
│   
│
├── app/                       # App-level setup
│   ├── app.dart               # Root widget (MaterialApp, routes)
│   └── router.dart            # Navigation & routes (optional)
│
└── main.dart                  # Entry point


# 🧠 State Management Reasoning

This app uses Bloc (Cubit) because:

It separates UI from business logic clearly.

Makes state predictable (Cart updates, Favorites toggling, etc.).

Easier to scale and test than using only setState.

Good practice for production apps compared to only Provider or setState.

# 🎨 Features

Banner carousel

Bottom Nav Bar

Cart with quantity update (+/–)

Product listing with categories

Favorites management
