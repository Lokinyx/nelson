//=============================================================================
// LICENCE_BLOCK_BEGIN
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// LICENCE_BLOCK_END
//=============================================================================
// Generated by Nelson Interface Generator 1.0.0
//=============================================================================
#include "Error.hpp"
#include "slicot_tb01idBuiltin.hpp"
//=============================================================================
using namespace Nelson;
//=============================================================================
#ifdef __cplusplus
extern "C"
{
#endif
extern int tb01id_ ( const char *JOB, int *N, int *M, int *P, double *MAXRED, double *A, int *LDA, double *B, int *LDB, double *C, int *LDC, double *SCALE, int *INFO);
#ifdef __cplusplus
}
#endif
//=============================================================================
// [MAXRED_OUT, A_OUT, B_OUT, C_OUT, SCALE, INFO] = slicot_tb01id(JOB, MAXRED_IN, A_IN, B_IN, C_IN)
//=============================================================================
ArrayOfVector Nelson::SlicotGateway::slicot_tb01idBuiltin(Evaluator* eval, int nLhs, const ArrayOfVector& argIn)
{
    ArrayOfVector retval;
    if (nLhs > 6)
    {
        Error(eval, ERROR_WRONG_NUMBERS_OUTPUT_ARGS);
    }
    if (argIn.size() != 5)
    {
        Error(eval, ERROR_WRONG_NUMBERS_INPUT_ARGS);
    }
    // INPUT VARIABLES
    ArrayOf JOB = argIn[0];
    Dimensions dimsJOB = JOB.getDimensions();
    std::string JOB_string = JOB.getContentAsCString();
    const char* JOB_ptr = JOB_string.c_str();
    // IN/OUT VARIABLES
    ArrayOf MAXRED = argIn[1];
    Dimensions dimsMAXRED = MAXRED.getDimensions();
    MAXRED.promoteType(NLS_DOUBLE);
    ArrayOf MAXRED_output = MAXRED;
    MAXRED_output.ensureSingleOwner();
    double *MAXRED_output_ptr = (double*)MAXRED_output.getDataPointer();
    ArrayOf A = argIn[2];
    Dimensions dimsA = A.getDimensions();
    A.promoteType(NLS_DOUBLE);
    ArrayOf A_output = A;
    A_output.ensureSingleOwner();
    double *A_output_ptr = (double*)A_output.getDataPointer();
    ArrayOf B = argIn[3];
    Dimensions dimsB = B.getDimensions();
    B.promoteType(NLS_DOUBLE);
    ArrayOf B_output = B;
    B_output.ensureSingleOwner();
    double *B_output_ptr = (double*)B_output.getDataPointer();
    ArrayOf C = argIn[4];
    Dimensions dimsC = C.getDimensions();
    C.promoteType(NLS_DOUBLE);
    ArrayOf C_output = C;
    C_output.ensureSingleOwner();
    double *C_output_ptr = (double*)C_output.getDataPointer();
    // LOCAL VARIABLES
    ArrayOf N = ArrayOf::int32VectorConstructor(1);
    int* N_ptr = (int*)N.getDataPointer();
    N_ptr[0] = (int)B.getDimensions().getRows();
    ArrayOf M = ArrayOf::int32VectorConstructor(1);
    int* M_ptr = (int*)M.getDataPointer();
    M_ptr[0] = (int)B.getDimensions().getColumns();
    ArrayOf P = ArrayOf::int32VectorConstructor(1);
    int* P_ptr = (int*)P.getDataPointer();
    P_ptr[0] = (int)C.getDimensions().getColumns();
    ArrayOf LDA = ArrayOf::int32VectorConstructor(1);
    int* LDA_ptr = (int*)LDA.getDataPointer();
    LDA_ptr[0] = std::max(1, (int)N.getContentAsInteger32Scalar());
    ArrayOf LDB = ArrayOf::int32VectorConstructor(1);
    int* LDB_ptr = (int*)LDB.getDataPointer();
    LDB_ptr[0] = std::max(1, (int)N.getContentAsInteger32Scalar());
    ArrayOf LDC = ArrayOf::int32VectorConstructor(1);
    int* LDC_ptr = (int*)LDC.getDataPointer();
    LDC_ptr[0] = std::max(1, (int)P.getContentAsInteger32Scalar());
    // OUTPUT VARIABLES
    ArrayOf SCALE_output = ArrayOf::doubleMatrix2dConstructor((indexType)1, (indexType)(int)N.getContentAsInteger32Scalar());
    double *SCALE_output_ptr = (double*)SCALE_output.getDataPointer();
    ArrayOf INFO_output = ArrayOf::int32VectorConstructor(1);
    int *INFO_output_ptr = (int*)INFO_output.getDataPointer();
    // CHECK INPUT VARIABLES DIMENSIONS
    if (!dimsJOB.isScalar())
    {
        Error(eval, _W("Input argument #1: scalar expected."));
    }
    if (!dimsMAXRED.isScalar())
    {
        Error(eval, _W("Input argument #2: scalar expected."));
    }
    Dimensions dimsA_expected(std::max(1, (int)N.getContentAsInteger32Scalar()), (int)N.getContentAsInteger32Scalar());
    if (!dimsA.equals(dimsA_expected))
    {
        Error(eval, _("Input argument #3: wrong size.") + " " + dimsA_expected.toString() + " " + "expected" + ".");
    }
    Dimensions dimsB_expected(std::max(1, (int)N.getContentAsInteger32Scalar()), (int)M.getContentAsInteger32Scalar());
    if (!dimsB.equals(dimsB_expected))
    {
        Error(eval, _("Input argument #4: wrong size.") + " " + dimsB_expected.toString() + " " + "expected" + ".");
    }
    Dimensions dimsC_expected(std::max(1, (int)P.getContentAsInteger32Scalar()), (int)N.getContentAsInteger32Scalar());
    if (!dimsC.equals(dimsC_expected))
    {
        Error(eval, _("Input argument #5: wrong size.") + " " + dimsC_expected.toString() + " " + "expected" + ".");
    }
    // CALL EXTERN FUNCTION
    try
    {
        tb01id_ ( JOB_ptr, N_ptr, M_ptr, P_ptr, MAXRED_output_ptr, A_output_ptr, LDA_ptr, B_output_ptr, LDB_ptr, C_output_ptr, LDC_ptr, SCALE_output_ptr, INFO_output_ptr);
    }
    catch (std::runtime_error &e)
    {
        e.what();
        Error(eval, "tb01id function fails.");
    }
    // ASSIGN OUTPUT VARIABLES
    if (nLhs > 0)
    {
        retval.push_back(MAXRED_output);
    }
    if (nLhs > 1)
    {
        retval.push_back(A_output);
    }
    if (nLhs > 2)
    {
        retval.push_back(B_output);
    }
    if (nLhs > 3)
    {
        retval.push_back(C_output);
    }
    if (nLhs > 4)
    {
        retval.push_back(SCALE_output);
    }
    if (nLhs > 5)
    {
        retval.push_back(INFO_output);
    }
    return retval;
}
//=============================================================================
