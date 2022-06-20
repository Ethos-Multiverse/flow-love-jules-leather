import * as fcl from "@onflow/fcl";
import { useState, useEffect } from "react";
import { ToastContainer, toast } from "react-toastify";
import "./flow/config";
import 'react-toastify/dist/ReactToastify.css';

const App = () => {
  const [user, setUser] = useState();
  const [transactionStatus, setTransactionStatus] = useState("---");
  const [mintTxStatus, setMintTxStatus] = useState("---");
  const [setupTxStatus, setSetupTxStatus] = useState("---");
  const [isSetup, setIsSetup] = useState(false);

  // Toasty
  toast.error("Ohhh Shit")

  // Update user on page load
  useEffect(() => {
    fcl.currentUser.subscribe(setUser);
  }, []);

  console.log(user);

  // Batch mint 
  const batchMint = async () => {
    return "hey"
  }

  // Setup user
  const setupUser = async () => {
    return "hey"
  }

  // Authenticate user
  const AuthedState = () => {
    return (
      <>
        {/* Wallet */}
        <div>
          <button
            className="bg-gray-100 hover:bg-gray-200 focus:bg-gray-200 border hover:border-gray-300 focus:border-gray-300 rounded shadow-lg absolute top-4 right-4 lg:top-8 lg:right-8 p-4 flex items-center text-xs disabled:cursor-not-allowed"
            onClick={() => fcl.authenticate()}
            disabled={user.loggedIn}
          >
            {
              <>
                <span className="rounded-full h-2 w-2 block mr-2 bg-green-500" />
              </>
            }
            {user.addr}
          </button>
          <button className="" onClick={fcl.unauthenticate}>
            Disconnect
          </button>
        </div>

        {/* Main Page */}
        <div className="space-y-8">
          <h1 className="text-4xl font-semibold mb-8">
            Love Jules Leather Admin
          </h1>
          {/* Metrics */}
          <div>
            <p className="flex">
              Contract:{" "}
              <a
                href="https://testnet.flowscan.org/contract/A.d8144e7c81e68eb9.LoveJulesLeatherV1"
                target="_blank"
              >
                {" "}
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  className="h-5 w-5"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path
                    fillRule="evenodd"
                    d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z"
                    clipRule="evenodd"
                  />
                </svg>
              </a>
            </p>
            <p>Flow Balance: ---</p>
            <p>Tokens Minted: ---</p>
            <p>Contract Value: ---</p>
            <p>Transaction Status: {transactionStatus}</p>
          </div>

          {/* Batch Mint */}
          <div className="space-y-8">
            <div className="bg-gray-100 p-4 lg:p-8">
              <div className="text-center">
                <h2 className="text-2xl font-semibold mb-2">Mint NFTs</h2>
                <label className="text-gray-600 text-sm mb-2 inline-block">
                  {/* {isSetup
                    ? "Currently restricted to one NFT per mint"
                    : "You must send an approval transaction before minting"} */}
                    Setup before minting. Batch mint restricted to 6 NFTs.
                </label>
                <div className="flex justify-center">
                  {/* {isSetup ? (
                    <button
                      className="bg-blue-600 hover:bg-blue-700 text-white py-4 px-8 rounded-tr rounded-br rounded-tl rounded-bl w-1/3 "
                      onClick={() => batchMint()}
                    >
                      {"Mint"}
                    </button>
                  ) : (
                    <button
                      className="mr-20 bg-blue-600 hover:bg-blue-700 text-white py-4 px-8 rounded-tr rounded-br rounded-tl rounded-bl w-1/3 "
                      onClick={() => setupUser()}
                    >
                      {"Setup"}
                    </button>
                  )} */}
                  <button
                      className="mr-20 bg-blue-600 hover:bg-blue-700 text-white py-4 px-8 rounded-tr rounded-br rounded-tl rounded-bl w-1/3 "
                      onClick={() => setUser()}
                    >
                      {"Setup"}
                    </button>

                    <button
                      className="bg-blue-600 hover:bg-blue-700 text-white py-4 px-8 rounded-tr rounded-br rounded-tl rounded-bl w-1/3 "
                      onClick={() => batchMint()}
                    >
                      {"Batch Mint"}
                    </button>

                </div>
              </div>
            </div>
          </div>
        </div>
      </>
    );
  };

  const UnauthenticatedState = () => {
    // setMessage("Connect Wallet");
    return (
      <div>
        <button
          className="bg-gray-100 hover:bg-gray-200 focus:bg-gray-200 border hover:border-gray-300 focus:border-gray-300 rounded shadow-lg absolute top-4 right-4 lg:top-8 lg:right-8 p-4 flex items-center text-xs disabled:cursor-not-allowed"
          onClick={() => fcl.authenticate()}
        >
          {
            <>
              <span className="rounded-full h-2 w-2 block mr-2 bg-red-500" />
            </>
          }
          {/* {message} */}
          Connect Wallet
        </button>
        <div className="space-y-8">
          <h1 className="text-4xl font-semibold mb-8">
            Love Jules Leather Admin
          </h1>
        </div>
      </div>
    );
  };

  return (
    <div className="max-w-xl mt-36 mx-auto px-4">
      {user?.loggedIn ? <AuthedState /> : <UnauthenticatedState />}
    </div>
  );
}

export default App;
