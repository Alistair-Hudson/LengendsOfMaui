﻿// -----------------------------------------------------------------------
// <copyright file="ILogItem.cs" company="">
// Triangle.NET code by Christian Woltering, http://triangle.codeplex.com/
// </copyright>
// -----------------------------------------------------------------------

using System;

namespace TriangleNet.Logging
{
    /// <summary>
    ///     A basic log item interface.
    /// </summary>
    public interface ILogItem
    {
        DateTime Time { get; }
        LogLevel Level { get; }
        string Message { get; }
        string Info { get; }
    }
}