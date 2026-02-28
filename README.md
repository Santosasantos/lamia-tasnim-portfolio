# Academic Portfolio Website

A modern, full-featured portfolio website built for Lamia Tasnim - A Mental Health Advocate. This professional portfolio showcases academic achievements, research publications, work experience, and provides an intuitive admin panel for content management.

## 🌟 Features

### Public-Facing Features
- **Dynamic Portfolio Pages**: Beautiful, responsive pages showcasing:
  - Academic publications (peer-reviewed articles, conference papers)
  - Education history
  - Professional experience (Research & Industry)
  - Skills & certifications
  - Awards & achievements
  - Volunteering activities
  - Scholarly activities
  - Contact form with email notifications

### Admin Panel
- **Secure Authentication**: Protected admin dashboard with role-based access
- **Content Management System**: Easy-to-use interface for managing all portfolio content
- **Media Management**: Upload and manage images, PDFs, and conference materials
- **Real-time Updates**: Content changes reflect immediately with automatic cache revalidation
- **CRUD Operations**: Create, read, update, and delete all portfolio sections

### Technical Features
- **Server-Side Rendering**: Optimized performance with Next.js Server Components
- **Database Integration**: Powered by Supabase for scalable data management
- **File Storage**: Secure file uploads with Supabase Storage
- **Email Integration**: Contact form submissions via Resend API
- **SEO Optimized**: Meta tags, structured data, and semantic HTML
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Dark/Light Mode**: Theme support (ready for implementation)

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 16 (App Router)
- **UI Library**: React 19
- **Styling**: Tailwind CSS 4
- **UI Components**: Radix UI
- **Icons**: Lucide React
- **Forms**: React Hook Form + Zod validation

### Backend & Database
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **File Storage**: Supabase Storage
- **Email Service**: Resend API

### Development
- **Language**: TypeScript
- **Package Manager**: npm
- **Deployment**: Vercel

## 📋 Prerequisites

Before running this project, ensure you have:

- Node.js 18+ installed
- npm or yarn package manager
- Supabase account (for database and storage)
- Resend API key (for email functionality)
- Git (for version control)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd portfolio-db-amir-main
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Environment Variables

Create a `.env.local` file in the root directory:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
RESEND_API_KEY=your_resend_api_key
```

### 4. Database Setup

1. Create a Supabase project
2. Run the SQL scripts in the `scripts/` directory in order:
   - `001_create_tables.sql` - Creates all necessary tables
   - `003_create_storage_bucket.sql` - Sets up file storage
   - `006_fix_rls_policies.sql` - Configures Row Level Security

### 5. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

### 6. Build for Production

```bash
npm run build
npm start
```

## 📁 Project Structure

```
portfolio-db-amir-main/
├── app/                    # Next.js App Router pages
│   ├── admin/             # Admin panel routes
│   ├── api/               # API routes
│   ├── auth/              # Authentication pages
│   └── [pages]/           # Public-facing pages
├── components/            # React components
│   ├── ui/               # Reusable UI components
│   └── [feature]/        # Feature-specific components
├── lib/                   # Utility functions
│   └── supabase/         # Supabase client configuration
├── scripts/              # Database migration scripts
├── public/               # Static assets
└── proxy.ts              # Next.js proxy middleware
```

## 🔐 Authentication

The admin panel is protected by Supabase Authentication. To access:

1. Navigate to `/auth/login`
2. Use your admin credentials
3. All admin routes are automatically protected

## 📝 Content Management

All content can be managed through the admin panel at `/admin`. The system supports:

- **Publications**: Academic papers, conference presentations, work in progress
- **Education**: Academic degrees and certifications
- **Experience**: Research and industry positions
- **Skills**: Categorized skills with proficiency levels
- **Awards**: Academic and professional recognitions
- **Certifications**: Professional certifications with credentials
- **Volunteering**: Community service activities
- **Scholarly Activities**: Academic service and contributions

## 🚢 Deployment

This project is optimized for deployment on Vercel:

1. Push your code to GitHub
2. Import the repository in Vercel
3. Add environment variables in Vercel dashboard
4. Deploy automatically on every push

### Environment Variables for Production

Ensure all environment variables from `.env.local` are added to your Vercel project settings.

## 🔧 Key Features Implementation

### Cache Management
- Dynamic rendering enabled for real-time content updates
- Automatic cache revalidation on content changes
- Optimized for production performance

### File Uploads
- Image uploads for conference materials and certifications
- PDF uploads for academic papers
- Secure file storage with Supabase

### Email Notifications
- Contact form submissions sent via Resend
- Automatic email notifications for admin

## 📚 Documentation

- **Authentication Setup**: See `AUTHENTICATION_FIX.md`
- **Email Configuration**: See `EMAIL_SETUP.md`
- **Database Schema**: Check SQL scripts in `scripts/` directory

## 🤝 Support

For questions or support regarding this project, please contact the development team.

## 📄 License

This project is proprietary and confidential. All rights reserved.

---

**Built with ❤️ for MD. Amir Hossen**

[![Deployed on Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black?style=for-the-badge&logo=vercel)](https://vercel.com)
