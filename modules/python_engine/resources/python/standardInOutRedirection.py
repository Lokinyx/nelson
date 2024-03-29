# =============================================================================
# Copyright (c) 2016-present Allan CORNET (Nelson)
# =============================================================================
# This file is part of the Nelson.
# =============================================================================
# LICENCE_BLOCK_BEGIN
# SPDX-License-Identifier: LGPL-3.0-or-later
# LICENCE_BLOCK_END
# =============================================================================
import sys
# =============================================================================
class StdoutCatcher:

    def __init__(self):
        self.data = ''

    def write(self, val):
        self.data += val
# =============================================================================
stdout_catcher = StdoutCatcher()
stderr_catcher = StdoutCatcher()
# =============================================================================
sys.stdout = stdout_catcher
sys.stderr = stderr_catcher
# =============================================================================
