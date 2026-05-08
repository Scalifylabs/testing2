import Link from 'next/link';

export default function Home() {
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Next.js on Plesk
        </h2>
        <p className="mt-2 text-center text-sm text-gray-600">
          Deployed via Phusion Passenger
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          <div className="space-y-6">
            <div>
              <p className="text-sm font-medium text-gray-700">Project Status</p>
              <div className="mt-1">
                <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                  Operational
                </span>
              </div>
            </div>
            
            <div>
              <p className="text-sm font-medium text-gray-700">Test API Endpoint</p>
              <div className="mt-1">
                <Link href="/api/hello" className="text-indigo-600 hover:text-indigo-500 font-medium text-sm">
                  /api/hello &rarr;
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
