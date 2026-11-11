import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "LPG Cylinder Log",
  description: "When did the cylinder actually arrive",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
