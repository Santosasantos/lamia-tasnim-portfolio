import type React from "react"
import type { Metadata } from "next"
import { Inter, Playfair_Display } from "next/font/google"
import { Analytics } from "@vercel/analytics/next"
import "./globals.css"

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" })
const playfair = Playfair_Display({ subsets: ["latin"], variable: "--font-playfair" })

export const metadata: Metadata = {
  title: "Lamia Tasnim | Public Health Professional & Mental Health Systems Advocate",
  description:
    "Portfolio of Lamia Tasnim — Bangladeshi public health professional, researcher, and mental health systems advocate working across research, responsible AI in healthcare, and community mental health programming.",
  keywords: [
    "Public Health",
    "Mental Health",
    "Mental Health Systems",
    "Global Mental Health",
    "Health Equity",
    "Digital Health",
    "AI in Healthcare",
    "Research",
    "Bangladesh",
    "Portfolio",
  ],
  authors: [{ name: "Lamia Tasnim" }],
  icons: {
    icon: "/icon",
    apple: "/icon",
  },
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en">
      <body className={`${inter.variable} ${playfair.variable} font-sans antialiased`}>
        {children}
        <Analytics />
      </body>
    </html>
  )
}
