pragma solidity ^0.8.0;

/* @notice This is a Solidity implementation to Fibonacci sequence
 * problem.
 * @author Wenceslas Sanchez
 * @dev the Binet implementation is missing.
*/
contract Fibonacci {
    /* @notice
     * @dev This method use a lot of gas to run. Recursive methods
     * are not good ideas.
     * For instance with RemixIDE, its hard to go further 10th term.
    */
    function fibRecursiveTerm(uint _n) public pure returns (uint) {
        uint result;

        if (_n < 2) {
            result = _n;
        } else {
            result = fibRecursiveTerm(_n - 1) + fibRecursiveTerm(_n - 2);
        }

        return result;
    }

    /* @notice Naive recursive implementation of Fibonacci sequence problem.
     * @dev It is based on fibRecursiveTerm => consume a lot of gas.
     *
    */
    function fibRecursive(uint _n) public pure returns (uint[] memory) {
        uint[] memory result= new uint[](_n + 1);

        for (uint i = 0; i < _n + 1; i++) {
            result[i]= fibRecursiveTerm(i);
        }

        return result;
    }

    /* @notice Implementation of Fibonacci sequence problem with memoization.
     * @dev Max computable term around 400.
    */
    function fibMemoization(uint _n) public pure returns (uint[] memory) {
        uint cache_size;
        if (_n < 3) {
            cache_size= 3; // because we need to cache at least 3 first values.
        } else {
            cache_size= _n + 1;
        }
        uint[] memory cache= new uint[](cache_size);
        uint[] memory result= new uint[](_n + 1);
        cache[0]= 0;
        cache[1]= 1;
        cache[2]= 1;

        for (uint i= 0; i < _n + 1; i++) {
            if (i > 2) {
                cache[i] = cache[i - 1] + cache[i - 2];
            }
            result[i]= cache[i];
        }

        return result;
    }

}

