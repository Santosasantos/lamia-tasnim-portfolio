import type React from "react"
import type { Metadata } from "next"
import { Inter, Playfair_Display } from "next/font/google"
import { Analytics } from "@vercel/analytics/next"
import "./globals.css"

const inter = Inter({ subsets: ["latin"], variable: "--font-inter" })
const playfair = Playfair_Display({ subsets: ["latin"], variable: "--font-playfair" })

export const metadata: Metadata = {
  title: "Rifat Ahmed | Software Engineer & Research Enthusiast",
  description:
    "Portfolio of Rifat Ahmed - Software Engineer & Research Enthusiast specializing in full-stack development, machine learning, AI applications in healthcare, and fintech solutions for emerging markets.",
  keywords: ["Software Engineer", "Full Stack Developer", "Machine Learning", "AI", "Research", "Portfolio", "Bangladesh", "Tech"],
  authors: [{ name: "Rifat Ahmed" }],
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
