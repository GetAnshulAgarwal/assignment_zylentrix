# API Fetching Flutter Application

A beautiful Flutter application that demonstrates fetching data from a public API and displaying it in a modern UI with proper loading indicators and error handling.

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/a1560af8-dd70-4ea2-bad4-5fca2a9358d1" width="300">
  <img src="https://github.com/user-attachments/assets/6bf2e57f-c318-4e7c-bcef-1a59ea5ec276" width="300">
</p>

## Project Setup Instructions

1. **Clone the repository**
   ```
   git clone <repository-url>
   ```

2. **Navigate to the project directory**
   ```
   cd assignment_zylentrix
   ```

3. **Install dependencies**
   ```
   flutter pub get
   ```

4. **Run the application**
   ```
   flutter run
   ```

## Project Structure

```
lib/
  ├── main.dart                  
  ├── models/
  │   └── post.dart              # Post data model
  ├── screens/
  │   ├── home_screen.dart       # Main screen showing the posts
  │   └── post_detail_screen.dart # Detailed view of a single post
  ├── services/
  │   └── api_service.dart       # API service to fetch data
  └── widgets/
      ├── post_list.dart         # Widget to display the list of posts
      ├── post_item.dart         # Widget for individual post item
      └── error_display.dart     # Widget to display error messages
```

## Assumptions or additional enhancements that can be made 

- Add search functionality
- Implement filtering and sorting options
- Add pagination for large datasets
- Implement caching for offline support
- Add animations for list items
- Create a dark mode theme
