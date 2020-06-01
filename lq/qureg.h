/**@file
 * @brief     Quantum Register.
 * @authors   Igor Lesik 2020
 * @copyright Igor Lesik 2020
 *
 * @see http://www.libquantum.de/api/1.1/Quantum-registers.html
 */
#pragma once

#include <cstdint>
#include <vector>

namespace lq {

/**Quantum register as sparce array of qubits.
 *
 * @see http://www.libquantum.de/api/1.1/Quantum-registers.html
 */
template <typename T = double>
struct Qureg
{
    const uint8_t width;   ///< number of qubits in the Qureg
    const uint8_t hashw;   ///< width of the hash array
    const uint64_t hashsz;  ///< size of the hash array

    std::vector<T> realAmp;
    std::vector<T> imgnAmp;

    using State = uint64_t;
    std::vector<State> state;

    ///< Get number of non-zero vectors.
    uint64_t size() const {return state.size();}

    using Hash = uint32_t;
    Hash hash[];

    Qureg(uint8_t width, uint64_t size=0, uint8_t hashw=0):
         width(width), hashw(hashw), hashsz(hashw ? (1 << hashw):0)
    {
        //hashw = hashw ? (std::max(hashw,width+2/*TODO check*/)) : 0;
        hash = hashw ? new Hash[hashsz] : nullptr;

        if (size) {
            state.resize(size);
            realAmp.resize(size);
            imgnAmp.resize(size);
        }
    }

   ~Qureg()
    {
        if (hash) delete[] hash;
    }
};

} // namespace lq
