import { NextResponse } from 'next/server';

export async function GET() {
  return NextResponse.json({
    status: 'success',
    message: 'API is running smoothly on Plesk with Passenger',
    timestamp: new Date().toISOString()
  });
}
